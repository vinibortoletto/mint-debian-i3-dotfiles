#!/bin/bash
source ./functions.sh

echo_doing 'Updating packages'
sudo nala update
sudo nala upgrade -y
sudo nala autopurge -y
sudo nala clean
echo_done

echo_doing 'Updating flatpak'
flatpak update -y
echo_done