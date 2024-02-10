#!/bin/bash

# - - - - - - - - - - - - - - - - -

title () {
  echo ""
  echo "# = = = = = = = = = = = = = = ="
  printf "#$(tput setaf 5) The Linux Installer$(tput sgr0)\n"
  echo "# = = = = = = = = = = = = = = ="
}

heading () {
  printf "\n#$(tput setaf 6) $1 $(tput sgr0)\n\n"
}

installed () {
  printf "\n#$(tput setaf 2) $1 $(tput sgr0)\n\n"
}


# - - - - - - - - - - - - - - - - -

title

heading "Upgrading system packages ..."
sudo apt update
sudo apt upgrade -y

heading "Installing essential packages ..."
sudo apt install -y build-essential bash-completion xclip curl git wget autoconf texinfo

heading "Installing tools ..."
sudo apt install -y mc htop

if [ ! -d "/home/linuxbrew" ]; then
  heading "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/$USER/.profile
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
else
  installed "Homebrew already installed."
fi

if [ ! -d "/home/linuxbrew/.linuxbrew/Cellar/asdf" ]; then
  heading "Installing asdf ..."
  brew install asdf
else
  installed "asdf already installed."
fi

heading "Installing Signal ..."
sudo snap install signal-desktop

if [[ $XDG_CURRENT_DESKTOP == *"GNOME"* ]];
then
  heading "Installing Gnome Tweaks ..."
  sudo apt install -y gnome-tweaks
fi

