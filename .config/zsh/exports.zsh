#!/bin/bash

# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacritty"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999

s=$HOME/.dotfiles/.scripts
export PATH=$PATH:$s/tmux:$s/rsync:$s/git:$s/stow

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Identify Operating System
if [[ $(uname -o) == "Android" ]]; then
    export OS="Termux"
elif [[ -n "$WSL_DISTRO_NAME" ]]; then
    export OS="WSL"
elif [[ $(uname -s) == "Darwin" ]]; then
    export OS="macOS"
else
    export OS="idk"
fi

# Define OBSIDAN Folder 
if [[ "$OS" == "WSL" ]]; then
    export OBSIDIAN="$HOME/LLO/"
elif [[ "$OS" == "Termux" ]]; then
    export OBSIDIAN="$HOME/storage/shared/La-Libreta-Online"
else
    export OBSIDIAN="$HOME/storage/shared/La-Libreta-Online"
fi

# Windows Exports
export OBSIDIANWIN="/mnt/c/Users/sebas/Desktop/LLO/"
export Roaming="/mnt/c/Users/sebas/AppData/Roaming/"

# Termux Exports

