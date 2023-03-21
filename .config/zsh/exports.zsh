#!/bin/sh
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

#TODO: manera para identificar si estoy en wsl o termux para que
#Las variables OBSIDIAN, BIBLIOTECA y alguna otra sean globales.

export OBSIDIAN="$HOME/LLO/"
export OBSIDIANWIN="/mnt/c/Users/sebas/Desktop/LLO/"

export TERMUX=0
termux=$PREFIX | grep -o "com.termux"
if [[ "$termux" = "com.termux" ]]; then
    export TERMUX=1
fi

# Windows Exports
export Roaming="/mnt/c/Users/sebas/AppData/Roaming/"

# Termux Exports

