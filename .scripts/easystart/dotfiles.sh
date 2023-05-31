#!/bin/bash

config_dotfiles() {
    cd ~

    # Delete existing files
    files=(
        ".bash_history"
        ".bash_logout"
        ".bashrc"
        ".profile"
        ".zcompdump"
        ".zsh_history"
    )

    for file in "${files[@]}"; do
        sudo rm -f "${file}"
    done

    git clone https://github.com/Tio-Panda/.dotfiles.git
    cd .dotfiles
    stow -D .
    stow .
    git remote set-url origin git@github.com:Tio-Panda/.dotfiles.git

    #TODO: Solo en TERMUX NO BORRAMOS .termux

    # Terminamos de configurar zsh
    command -v zsh | sudo tee -a /etc/shells
    sudo chsh -s "$(command -v zsh)" "${USER}"
    echo "Terminamos de configurar los dotfiles"
}
