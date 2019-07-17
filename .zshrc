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

# --------------- Aliases --------------- 
#
alias ls='ls --color=auto'
alias open='xdg-open'
alias make='make -j4'
alias rspec='rspec --color'
alias todo='vim $HOME//todo.md'
alias pyenv-init='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'


# --------------- ENV  ------------------

export EDITOR=vim

# --------------- PATH ------------------

# add home bin dir to PATH
export PATH="$PATH:$HOME/bin"

# add ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# pyenv config
alias pyenv-init='eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"'

#antigen
source ~/.dotfiles/antigen/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle colored-man-pages

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

