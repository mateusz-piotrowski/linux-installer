#!/bin/bash

# - - - - - - - - - - - - - - - - -

title () {
  echo ""
  echo "# = = = = = = = = = = = = = = ="
  printf "#$(tput setaf 4) The Linux Installer$(tput sgr0)\n"
  echo "# = = = = = = = = = = = = = = ="
}

heading () {
  printf "\n\n# $1\n\n"
}

# - - - - - - - - - - - - - - - - -

title

heading "Upgrading system packages ..."
sudo apt update
sudo apt upgrade -y

heading "Installing essential packages ..."
sudo apt install -y build-essential bash-completion xclip curl git wget

heading "Installing tools ..."
sudo apt install -y mc htop

heading "Installing Signal ..."
sudo snap install signal-desktop

if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]];
then
  heading "Installing Gnome Tweaks ..."
  sudo apt install -y gnome-tweaks
fi

heading "Installing Elixir ..."
sudo apt install elixir
