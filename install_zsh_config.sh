#!/usr/bin/env bash
source ./functions.sh

echo_doing 'Installing ZSH puglins'

############################
### Fix Zsh show startup ###
############################

git config --add oh-my-zsh.hide-status 1
git config --add oh-my-zsh.hide-dirty 1

###########################
### Install Zsh plugins ###
###########################

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#####################
### Powerlevel10k ###
#####################

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp -r .oh-my-zsh ~/

####################
### Copy .zshrc file
####################

cp .zshrc ~/

echo_done
