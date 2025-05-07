#!/bin/sh

#sudo pacman -S --noconfirm --needed git
#sudo pacman -S --noconfirm --needed zsh
#sudo pacman -S --noconfirm --needed nerd-fonts
#sudo pacman -S --noconfirm --needed wl-clipboard
#sudo pacman -S --noconfirm --needed lazygit
#sudo pacman -S --noconfirm --needed man

#sudo chsh -s $(which zsh)
#chsh -s $(which zsh)

if ! test -d $ZSH
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi
# install paru

if ! command -v paru 2>&1 >/dev/null
then
	sudo pacman -S --noconfirm --needed rustup, base-devel

	rustup

	git clone https://aur.archlinux.org/paru.git
	cd paru && makepkg -si
	cd ../ && rm -rf paru
fi

# install wezterm
if ! command -v wezterm 2>&1 >/dev/null
then
	paru -S wezterm-git
fi

if ! command -v zen-browser 2>&1 >/dev/null
then
	paru -S zen-browser-bin
fi

cp -r ./config/* $XDG_CONFIG_HOME
