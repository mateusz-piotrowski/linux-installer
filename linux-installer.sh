#!/bin/bash

title () {
  echo ""
  echo "# = = = = = = = = = = = = = = ="
  echo "# The Linux Installer"
  echo "# = = = = = = = = = = = = = = ="
}

heading () {
  printf "\n\n# $1\n\n"
}

title

heading "Upgrading system packages ..."
sudo apt update
sudo apt upgrade -y

heading "Installing essential packages ..."
sudo apt install -y build-essential bash-completion curl git wget

heading "Installing tools ..."
sudo apt install -y mc htop

heading "Installing Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/$USER/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

heading "Installing Homebrew tools ..."
brew install gh

heading "Installing Signal ..."
sudo snap install signal-desktop

if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]];
then
  heading "Installing Gnome Tweaks ..."
  sudo apt install -y gnome-tweaks
fi

