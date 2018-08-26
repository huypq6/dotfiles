#!/bin/bash

echo "Clone source from github..."
git clone https://github.com/teni-ime/ibus-teni
cd ibus-teni
make build
sudo make install
echo "Install ibus-teni was done. Restart to take the effect."
echo "Cleaning..."
cd .. && rm -rf ibus-teni
