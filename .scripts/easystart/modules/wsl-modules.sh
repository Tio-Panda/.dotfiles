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
