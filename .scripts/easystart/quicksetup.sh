#!/bin/bash

# Import handing functions
source modules/wsl-modules.sh
source modules/termux-modules.sh

source apps/zsh.sh
source apps/tmux.sh
source apps/neovim.sh

source dotfiles.sh

# Identify Operating System
if [[ $(uname -o) == "Android" ]]; then
    os="Termux"
elif [[ -n "$WSL_DISTRO_NAME" ]]; then
    os="WSL"
elif [[ $(uname -s) == "Darwin" ]]; then
    os="macOS"
else
    os="idk"
fi

# Install modules by OS
if [[ "$os" == "WSL" ]]; then
    install_wsl_modules
elif [[ "$os" == "Termux" ]]; then
    install_termux_modules
else
    echo "os can not be identified"
fi

# Install apps
install_zsh
install_tmux
install_neovim

# Configure dotfiles
config_dotfiles

