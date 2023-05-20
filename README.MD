# Huy Pham KDE Plasma configurations
This is KDE environment of HuyPQ.

## 1. Features
Distro: ArchLinux  
DE: Plasma  
WM: Kwin  
WM Theme: Arc-Dark  
Theme: Arc-Darker  
Icons: Papirus  

## 2. Installation Archlinux
### 2.1. Make bootable USB
Download Arch ISO from archlinux.org
Use Balena Etcher to flash into USB.

### 2.2. Install System
2.2.1 Prepare Root Partition

2.2.2 Copy System to Partition
```
mount /dev/sda1 /mnt
```
```
pacstrap /mnt base linux linux-firmware vim nano
genfstab -U /mnt >> /mnt/etc/fstab
```
Now use arch-chroot and enter the mounted disk as root
```
arch-chroot /mnt
```
Set timezone
```
timedatectl list-timezones
timedatectl set-timezone Asia/Ho_Chi_Minh
```

This is what sets the language, numbering, date and currency formats for your system.

```
vim /etc/locale.conf
```

Uncomment ```en_US.UTF-8```

Setup hostname
```
echo myhostname > /etc/hostname
```

Setup root password
```
passwd
```

Create user
```
useradd -m huypq6
passwd
```
Install sudo
```
pacman -S sudo
```

add this line to visudo
```
visudo
huypq6 ALL=(ALL) ALL
```
### 2.2.3 Install KDE
```
pacman -S xorg xorg-xinit
pacman -S base-devel plasma networkmanager plasma-nm
pacman -S firefox konsole dolphin
```

Enable SDDM
```
systemctl enable sddm
```

Enable Network
```
systemctl enable NetworkManager
```

### 2.2.4 Reboot
```
exit
umount /mnt
reboot
```

## 3. More Resources

### 3.1 Color scheme at

https://terminal.sexy/#OERQ5ubmHR8hpxAHFo9F7JMAJGHojjzCJ2DgxcjGlpiWzDQrAMlO-6kiOXHtqWPWOXHt____

### 3.2 Wallpaper download at

https://unsplash.com/photos

## 4. Tools

1. Create cool text at [Patorjk](http://patorjk.com/software/taag).

## 5. Vietnamese

Some KDE application has problem with ibus vietnamese input method. Need to follow this guide

```
export QT_IM_MODULE=ibus
```

to **~/.xprofile** and restart your X user session. 

if this does not work try to add
```
export OOO_FORCE_DESKTOP="gnome"
```

to **~/.xprofile**, this variable worked with libreoffice and IntelliJ Idea


## 6. Titling Window Manager
I want to use KDE with titling window manager as i3. I use Kronhkite script for titling with custom shortcut configurationfor virtual desktop and window navigation.

### 6.1. Install KronhKite


### 6.2. Config virtual desktop
Prefer to use 10 virtual desktop with disticn purpose, the desktop name is configured in **kwinrc** file. 
In order to view desktop indicator in taskbar as i3, i use [virtual-desktop-bar](https://github.com/wsdfhjxc/virtual-desktop-bar) applet

```
git clone https://github.com/wsdfhjxc/virtual-desktop-bar
cd virtual-desktop-bar
./script/install-dependency-arch.sh
./script/install.sh
```

virtual-desktop-bar was configured
+ Disable Add Desktop button
+ Show only current desktop
+ Show only occupied desktop
+ Display Number with name

config **plasma-org.kde.plasma.desktop-appletsrc** file in **./config** for virtual-desktop-bar like that 

```
[Containments][2][Applets][44]
immutability=1
plugin=org.kde.plasma.virtualdesktopbar

[Containments][2][Applets][44][Configuration][ConfigDialog]
DialogHeight=682
DialogWidth=880

[Containments][2][Applets][44][Configuration][Preferences]
AddDesktopButtonShow=false
AddingDesktopsSwitchTo=false
DesktopButtonsShowOnlyForCurrentDesktop=true
DesktopButtonsShowOnlyForOccupiedDesktops=true
DesktopIndicatorsCustomColorForCurrentDesktop=#3daee9
DesktopLabelsStyle=2
```

### 6.3. Startup Application

Startup application is stored in ```./config/autostart```, copy desktop file of application to here to run in startup.

+ Flameshot


Install autostart
```
cp .config/autostart/* ~/.config/autostart/
```

### 6.4. Stop Baloo indexer

Because Baloo requires a lot of RAM and CPU, i decided to disable Baloo. 

+ Goto **Setting -> Search**, disable **Enable File Search**. 
+ Disable baloo by command
```
balooctl stop
balooctl suspend
balooctl disable
```
+ Remove index file 
```
rm -rf ~/.local/share/baloo
```

## 8. Other configuration
1. [Font Awsome](https://fontawesome.com/v4.7/cheatsheet/)
2. [Completely disable baloo](https://www.dagorret.net/post/how-to-completely-disable-baloo/)
