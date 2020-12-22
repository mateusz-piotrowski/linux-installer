#!/bin/sh

echo '# = = = = = = = = = = = = = = ='
echo '# The Linux Notebook Installer'
echo '# = = = = = = = = = = = = = = ='

heading () {
    echo "\n$1\n"
}

heading "Upgrading system packages ..."
sudo apt update
sudo apt upgrade -y

heading "Installing essential packages ..."
sudo apt install -y build-essential bash-completion curl git wget

heading "Installing tools ..."
sudo snap install htop
