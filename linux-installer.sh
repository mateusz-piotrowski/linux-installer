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

heading "Installing Docker dependencies ..."
sudo apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common

heading "Adding Docker GPG Key and APT Repository ..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

heading "Installing Docker platform ..."
sudo apt-get install docker-ce docker-ce-cli containerd.io

heading "Installing Postgresql ..."
sudo snap install maas-test-db
