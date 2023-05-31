#!/bin/bash

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
