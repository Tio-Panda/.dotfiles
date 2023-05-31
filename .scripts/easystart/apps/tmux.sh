#!/bin/bash

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
