#!/bin/bash
source ./functions.sh

########################
### Removing Firefox ###
########################

echo_doing 'Removing Firefox'

sudo nala remove firefox -y
rm -rf /home/vini/.cache/mozilla/firefox
rm -rf /home/vini/.mozilla/firefox

echo_done

#############################
### Updating deb packages ###
#############################

echo_doing 'Updating deb packages'

sudo nala fetch

echo_done

###############################
### Installing deb packages ###
###############################

echo_doing 'Installing deb packages'

sudo nala install -y \
qbittorrent \
steam-installer \
lxappearance \
arandr \
dunst \
i3-wm \
i3blocks \
alacritty \
feh \
numlockx \
rofi \
fonts-firacode \
kdeconnect

echo_done

###############################
### Installing flatpak apps ###
###############################

echo_doing 'Install flatpak apps'

flatpak install -y \
com.visualstudio.code \
com.jetbrains.IntelliJ-IDEA-Community \
com.stremio.Stremio \
com.brave.Browser \
com.discordapp.Discord \
io.beekeeperstudio.Studio \
com.usebruno.Bruno \
org.kryogenix.Pick \

echo_done

#############################
### Installing Noto fonts ###
#############################

echo_doing 'Install Noto fonts'

mkdir fonts && cd fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz
tar -xf Noto.tar.xz
mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
cd .. && rm -rf ../fonts
fc-cache -f -v

echo_done

############################
### Copying config files ###
############################

echo_doing 'Copying config files'

cp -r .config ~/

echo_done

#############################
### Configuring bluetooth ###
#############################

# echo_doing 'Configuring bluetooth'

# cp policy-bluetooth ~/home/vini/.local/state/wireplumber/policy-bluetooth

# echo_done

###########################
### Copying backgrounds ###
###########################

echo_doing 'Copying backgrounds folders'

cp -r backgrounds ~/Pictures

echo_done

############################
### Copying monitor file ###
############################

echo_doing 'Copying monitor file'

cp monitor.sh ~/.screenlayout

echo_done

#############################
### Installing Github CLI ###
#############################

echo_doing 'Installing Github CLI'

git config --global user.email "ovinibortoletto@gmail.com"
git config --global user.name "Vinicius Bortoletto"

sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y \
&& gh auth login

echo_done
