#!/usr/bin/env bash
source ./functions.sh

echo_doing 'Installing ZSH'

sudo nala install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
