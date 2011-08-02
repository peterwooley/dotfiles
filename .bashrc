export PS1="[\t] \W\$ "
bind '"\e[5~":history-search-backward'
bind '"\e[6~":history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

alias la='ls -la'
alias ..='cd ..'
alias .='echo $PWD'

# Git commands are long!
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
