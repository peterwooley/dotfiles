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

# cd into Dropbox folder
cdx () {
	cd ~/My\ Documents/My\ Dropbox
}


alias la='ls -lAXk --color=always'
alias ..='cd ..'
alias .='echo $PWD'


