#!/bin/bash

echo "Clone source from github..."
git clone https://github.com/huypq6/st
cd st
make
sudo make install
echo "Install st was done."
echo "Cleaning..."
cd .. && rm -rf st
echo "Install st terminal completed!"

