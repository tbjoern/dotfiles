skip_global_compinit=1
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit promptinit
compinit
promptinit

# Arch Wiki recommendation for RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# End of lines added by compinstall

# --------------- ENV  ------------------

export EDITOR=vim
export NOTES_DIR="$HOME/development/personal/notes"

# --------------- PATH ------------------

# add home bin dir to PATH
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# add ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# pyenv config
alias pyenv-init='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'
eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"

# --------------- Aliases --------------- 
#
alias ls='ls --color=auto'
alias open='xdg-open'
alias make='make -j4'
alias rspec='rspec --color'
alias pyenv-init='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'
alias npm-exec='PATH=$(npm bin):$PATH'
alias gitc='git checkout'
alias gitp='git pull'
alias gitmk='git checkout -b'
alias gits='git status'

source ~/.dotfiles/notesrc

# -------------- Terminal Settings -----
stty -ixon

#antigen
source ~/.dotfiles/antigen/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle colored-man-pages
antigen bundle docker
antigen bundle docker-compose

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

