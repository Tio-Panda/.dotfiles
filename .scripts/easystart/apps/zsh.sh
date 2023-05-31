#!/bin/bash

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
