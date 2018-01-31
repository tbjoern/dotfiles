# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tbjoern/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias ls='ls --color=auto'
alias open='xdg-open'
alias make='make -j4'
alias rspec='rspec --color'

# Arch Wiki recommendation for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
# prompt walters

export PATH="$PATH:$HOME/.bin"

# wal autoconfig for new terminals
#(wal -r &)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export EDITOR=vim

# add ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

#antigen
source ~/dotfiles/antigen/bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

