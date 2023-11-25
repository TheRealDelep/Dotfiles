#!/bin/bash

echo "Removing old binaries"
sudo rm /usr/bin/nvim
sudo rm -r /usr/share/nvim/runtime 

echo "Copying new binaries to the good place"
sudo cp ./neovim/build/bin/nvim /usr/bin/
sudo cp -r ./neovim/runtime /usr/share/nvim/

echo "Hopefully everything is fixed..."
