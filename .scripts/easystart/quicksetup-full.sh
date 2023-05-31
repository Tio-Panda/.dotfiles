#!/bin/bash

install_wsl_modules() {

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get autoremove

    # Lista de módulos a instalar con apt
    modulos=( 
        "wget" "curl" "tar" "unzip" "gzip" "gettext" "build-essential" "cmake" 
        "fzf" "stow" "openssh-client" "git" "ripgrep" "fd-find"
        "python3" "luajit" "node.js" "npm" "ng-common" "pip"
        "autoconf"  "ninja-build" "libncurses5-dev" "libncursesw5-dev" "libevent-dev" "libncurses-dev"
    )

    # NOTE: Tambien esta ng-common, pero al instalar, quedaba en bucle infinito

    # Instalar los módulos uno por uno 
    for modulo in "${modulos[@]}"; do
        echo "Instalando $modulo..."

        # Le dice si a todas las preguntas
        sudo apt-get install -y "$modulo"

        # Verificar el código de salida del comando apt install
        if [ $? -eq 0 ]; then
            echo "El módulo $modulo se instaló correctamente."
        else
            echo "Hubo un error al instalar el módulo $modulo. Saliendo..."
            exit 1
        fi
    done
}

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

install_zsh() {

    # Instalando Zsh
    ZSH_VER="5.9"
    cd ~
    echo "Instalando zsh..."
    chsh -s /bin/bash
    sudo apt-get -y remove zsh
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/zap"
    wget https://github.com/zsh-users/zsh/archive/refs/tags/zsh-${ZSH_VER}.tar.gz
    tar -xf zsh-${ZSH_VER}.tar.gz
    rm -f zsh-${ZSH_VER}.tar.gz
    cd zsh-zsh-${ZSH_VER}
    pwd

    autoconf
    ./configure
    make
    make install
    cd ~
    rm -rf zsh-zsh-${ZSH_VER}
    echo "zsh listo!"

    # Instalando ZAP para zsh
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
}

install_tmux() {

    # Instalando Tmux
    TMUX_VER="3.3a"
    cd
    echo "Instalando tmux..."
    sudo apt-get -y remove tmux
    sudo apt-get -y install wget tar libevent-dev libncurses-dev
    wget https://github.com/tmux/tmux/releases/download/${TMUX_VER}/tmux-${TMUX_VER}.tar.gz
    tar xf tmux-${TMUX_VER}.tar.gz
    rm -f tmux-${TMUX_VER}.tar.gz
    cd tmux-${TMUX_VER}
    ./configure
    make
    sudo make install
    cd ..
    sudo rm -rf /usr/local/src/tmux-*
    sudo mv tmux-${TMUX_VER} /usr/local/src
    echo "tmux listo!"

}

install_neovim() {

    # Instalando Nvim
    NVIM_VER="0.9.0"
    echo "Instalando nvim..."
    cd ~
    wget https://github.com/neovim/neovim/archive/refs/tags/v${NVIM_VER}.tar.gz
    tar xf v${NVIM_VER}.tar.gz
    rm -rf v${NVIM_VER}.tar.gz
    cd neovim-${NVIM_VER}

    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd ~
    sudo rm -rf neovim-${NVIM_VER}
    echo "nvim listo!"

    # cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make clean && make 
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

