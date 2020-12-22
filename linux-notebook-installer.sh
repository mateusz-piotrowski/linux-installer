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
