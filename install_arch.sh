#!/bin/sh

# sudo pacman -S --noconfirm --needed git
# sudo pacman -S --noconfirm --needed zsh
# sudo pacman -S --noconfirm --needed nerd-fonts
# sudo pacman -S --noconfirm --needed wl-clipboard
# sudo pacman -S --noconfirm --needed man
# sudo pacman -S --noconfirm --needed pavucontrol
# sudo pacman -S --noconfirm --needed lazygit
# sudo pacman -S --noconfirm --needed tig
# sudo pacman -S --noconfirm --needed neovim
# sudo pacman -S --noconfirm --needed ripgrep
# sudo pacman -S --noconfirm --needed fzf
# sudo pacman -S --noconfirm --needed rofi-wayland
# sudo pacman -S --noconfirm --needed lua51 luarocks
# sudo pacman -S --noconfirm --needed hyprpaper
# sudo pacman -S --noconfirm --needed hyprlock
# sudo pacman -S --noconfirm --needed tmux
#
# sudo chsh -s $(which zsh)
# chsh -s $(which zsh)

if ! test -d $ZSH
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

if ! test -d "$HOME/.tmux/plugins/tpm"
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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

# install zen browser
if ! command -v zen-browser 2>&1 >/dev/null
then
	paru -S zen-browser-bin
fi

# install NVM and NodeJS
if ! command -v node 2>&1 >/dev/null
then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    echo "Restart your shell, then run \"nvm install lts\" and \"nvm use lts\""
fi

# install waybar
if ! command -v waybar 2>&1 >/dev/null
then
    paru -S waybar
fi

cp -r ./config/* $XDG_CONFIG_HOME

chmod +x $HOME/.config/scripts/*.sh
