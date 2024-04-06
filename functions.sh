#!/bin/bash

yellow='\033[33m'
green='\033[32m'
reset='\033[0m'

echo_doing () {
 local text="$1"
 local text_length=${#text}
 local padding_length=$((text_length + 8)) 
 local padding=$(printf '%*s' "$padding_length" | tr ' ' '#')

 echo -e "${yellow}"
 echo -e "${padding}"
 echo -e "### $text ###"
 echo -e "${padding}"
 echo -e "${reset}"
}

echo_done () {
  echo -e "${green}"
  echo -e "############"
  echo -e "### Done ###"
  echo -e "############"
  echo -e "${reset}"
}

reboot_prompt() {
  read -p "Do you want to reboot your system now? [y/n] " choice

  case "$choice" in
    y|Y )
      reboot
      ;;
    n|N )
      exit 0
      ;;
    * )
      echo "Invalid choice. Please enter 'y' or 'n'."
      exit 1
      ;;
  esac
}
