export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="philips"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/Library/Android/sdk/tools/:~/Library/Android/sdk/platform-tools/


export EDITOR="vim"

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  

#setopt AUTO_CD
unsetopt AUTO_CD

# mkdir, cd into it
mkcd () {
    mkdir -p "$*"
    cd "$*"
}

alias la='ls -la'

# Git commands are long!
alias ga='git add'
alias gp='git push'
alias gl='git log --oneline --graph'
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

# SVN commands are long too
alias ss='svn status'
alias sccl='svn commit --cl '
alias sd='svn diff --diff-cmd icdiff'
alias sl='svn log | less'

# Jump to the projects dir
alias cdp='cd ~/Dropbox/projects'

# node too
alias n='node'

alias marked="/Applications/Marked.app/Contents/MacOS/Marked"


# McAfee Doop Note
note() {
  if [[ -e ~/Dropbox/McAfee/doop/$1.md ]] then
    vim ~/Dropbox/McAfee/doop/${1}.md
  else
    echo "insert\n# ${1}\n" > tmp.note
    vim ~/Dropbox/McAfee/doop/${1}.md -S tmp.note
    rm tmp.note 2> /dev/null
  fi
}

# Key Bindings
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


# Use Ctrl-Z to switch back to Vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

function f() {
  find . -name $@
}

eval "$(thefuck --alias)"
alias darn="fuck"

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi
