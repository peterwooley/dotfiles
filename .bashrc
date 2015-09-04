source ~/Dropbox/config/git-completion.bash
source ~/Dropbox/config/git-prompt.sh

export PS1="[\t] \W/\$(__git_ps1 ' (%s)')\$ "
bind '"\e[5~":history-search-backward'
bind '"\e[6~":history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# Open man pages pretty-like
pman() {
	man -t "$@" | open -f -a Preview;
}

# Open first Google result for man page
iman() {
	eval last=\${$#}

	man -w $last > /dev/null
	if [ $? = 0 ]; then
		open "http://www.google.com/search?q=man+$last&btnI"
	fi
}

alias la='ls -la'

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

# This is the path that holds all of your projects.
# Projects must follow the mfs-branch naming convention.
# Examples: mfs-trunk, mfs-multi-tenant, mfs-203, mfs-252, etc.
export projects_base=~/Projects
export wifi_interface=en1

# This sources the framework.
if [ -a $projects_base/build_tools/general ]
	then
		. $projects_base/build_tools/general
		. $projects_base/build_tools/mfs
fi

store-wifi() {
	read-wifi > ~/Dropbox/McAfee/wifi.txt
}

# Use this if you are on OS X and want to use the fix-wifi command.
export wifi_interface=en1

# Reset Synergy
alias rsy='sudo /Library/LoginWindow/LoginHook.sh'

# Short path to mvim
alias m='mvim'

# Jump to the projects dir
alias cdp='cd ~/Dropbox/projects'

# coffee is just so long to type
alias c='coffee'

nf() {
  nodefront compile -w -r 1>> nf.log 2>> nf.log &
  nodefront serve -l ${1-8000} localhost 1>> nf.log 2>> nf.log &
}

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

