#!/bin/bash

clear

echo "Install dependencies"
echo 

sudo pacman -S git curl perl wget xdg-utils make cmake gcc base-devel linux-headers fastfetch htop duf firefox libreoffice-fresh spectacle ttf-jetbrains-mono-nerd

echo "Install paru"
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

echo "Install Caelestia"
echo
paru -S caelestia-cli
caelestia install

echo "Install sddm"
echo
sudo pacman -S sddm
sudo systemctl enable sddm

echo "Install config"
git clone https://github.com/vcelesa/nvim-config.git ~/.config/nvim
git clone https://github.com/vcelesa/shell-config.git
cp ./shell-config/keybinds.lua ~/.config/hypr/hyprland/keybinds.lua
cp ./shell-config/variables.lua ~/.config/hypr/variables.lua
cp ./shell-config/shell.json ~/.config/caelestia/shell.json
