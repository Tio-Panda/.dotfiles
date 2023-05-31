#!/bin/bash

install_termux_modules() {

    yes | pkg update
    yes | pkg upgrade

    yes | pkg install root-repo
    yes | pkg install x11-repo

    # Lista de módulos a instalar con apt
    modulos=(
        "wget" "curl" "tar" "unzip" "gzip" "gettext" "build-essential" "cmake"
        "fzf" "stow" "openssh" "git" "ripgrep" "fd"
        "python" "luajit" "nodejs"
        "autoconf" "ninja" "ncurses"
        "zsh" "tmux" "neovim"
    )

    # Instalar los módulos uno por uno 
    for modulo in "${modulos[@]}"; do
        echo "Instalando $modulo..."

        # Le dice si a todas las preguntas
        yes | pkg i "$modulo"

        # Verificar el código de salida del comando pgk i
        if [ $? -eq 0 ]; then
            echo "El módulo $modulo se instaló correctamente."
        else
            echo "Hubo un error al instalar el módulo $modulo. Saliendo..."
            exit 1
        fi
    done
}

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

# Install modules
install_termux_modules

# Configure dotfiles
config_dotfiles

