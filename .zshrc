#################
### Variables ###
#################

export BROWSER=/usr/bin/brave
export ZSH="$HOME/.oh-my-zsh"

##################
### Zsh Config ###
##################

ZSH_THEME="robbyrussell"

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
    nohup flatpak run --file-forwarding com.jetbrains.PhpStorm "$@" &
    disown
}

function idea() {
    nohup flatpak run --file-forwarding com.jetbrains.IntelliJ-IDEA-Community "$@" &
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
