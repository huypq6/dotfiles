#!/bin/bash

CONFIG_DIR=..

echo "Block ad by hblock"
hblock -H ${CONFIG_DIR}/hblock/hosts-header

echo "Start config system..."

echo "Configuring tmux"
cp $CONFIG_DIR/.tmux.conf ~
cp -r $CONFIG_DIR/.tmux ~

echo "Configuring vim"

echo "Configuring Kwin"

echo "Configuring plasma"
