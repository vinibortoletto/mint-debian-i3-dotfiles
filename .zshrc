# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################
### Variables ###
#################

export BROWSER=/var/lib/flatpak/exports/bin/com.brave.Browser
export ZSH="$HOME/.oh-my-zsh"

##################
### Zsh Config ###
##################

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
git
zsh-syntax-highlighting
fzf
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##################
### NVM Config ###
##################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#################
### Functions ###
#################

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

function update() {
    bash ~/Code/pop_os_config/update_system.sh
}

function phps() {
    nohup flatpak run --file-forwarding com.jetbrains.PhpStorm "$@" > /dev/null 2>&1 &
    disown
}

function idea() {
    nohup flatpak run --file-forwarding com.jetbrains.IntelliJ-IDEA-Community "$@" > /dev/null 2>&1 &
    disown
}

function code() {
   nohup flatpak run --file-forwarding com.visualstudio.code "$@" > /dev/null 2>&1 &
   disown
}


function dc() {
    if [[ $1 == "up" ]]; then
        docker-compose up -d
    elif [[ $1 == "down" ]]; then
        docker-compose down
    elif [[ $1 == "clean" ]]; then
        docker system prune -a
    elif [[ $1 == "down-all" ]]; then
        docker stop $(docker ps -a -q)
    else
        echo "Invalid command. Usage: dc up"
    fi
}

function up() {
   sudo nala update
   sudo nala upgrade -y
   sudo nala autopurge -y
   sudo nala clean

   flatpak update -y
}

#############
### Alias ###
#############

alias c='cp'
alias cf='cp -r'
alias r='rm'
alias rf='rm -rf'
alias a='aria2c'
alias ni='sudo nala install -y'
alias ns='nala search'
alias nr='sudo nala purge -y'
alias nu='sudo nala update && sudo nala upgrade -y'
alias nc='sudo nala autopurge -y && sudo nala clean'
alias fi='flatpak install -y'
alias fr='flatpak remove -y'
alias fu='flatpak update -y'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
