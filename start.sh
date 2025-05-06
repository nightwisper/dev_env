#!/bin/sh

sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed zsh

sudo chsh -s $(which zsh)
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
