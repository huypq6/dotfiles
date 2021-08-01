#!/bin/bash

MAJOR_VERSION=$(echo "$1" | egrep -o '[0-9]+.[0-99]+')
BASE_URL=https://download.qt.io/archive/qt/$MAJOR_VERSION/$1/qt-opensource-linux-x64-$1.run
FILE_NAME=qt-opensource-linux-x64-$1.run

cd /opt
echo "Downloading installation file in /opt"
wget $BASE_URL

echo "Change run permision for installation file"
chmod +x $FILE_NAME

echo "Start QT5 installation."
./$FILE_NAME 
echo "Installation DONE."
