#!/bin/bash

progsfile=./packages.csv

maininstall() { # Installs all needed programs from main repo.
	echo "-> Installing ""$1"" from Main Repo."
	sudo pacman --noconfirm --needed -S "$1" #&>/dev/null
	}

aurinstall() { \
	echo "-> Installing " "$1"" from AUR."
	yaourt --noconfirm --needed -S "$1" #&>/dev/null 
}

scriptinstall() { \
	echo "-> Installing " "$1"" from Script."
	./scripts/$1.sh
}

installationloop() { \
	([ -f "$progsfile" ] && cp "$progsfile" /tmp/progs.csv) || curl -Ls "$progsfile" > /tmp/progs.csv
	total=$(wc -l < /tmp/progs.csv)
	aurinstalled=$(pacman -Qm | awk '{print $1}')
	while IFS=, read -r Package Description Group repo; do
	n=$((n+1))
	case $repo in
	"") maininstall "$Package" ;;
	"A") aurinstall "$Package" ;;
	"G") gitmakeinstall "$Package" ;;
	"S") scriptinstall "$Package" ;;
	"*") echo "Unknow Repo.";;
	esac
done < /tmp/progs.csv ;}

echo "Start Installation loop..."
installationloop
