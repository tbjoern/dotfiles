# skip_global_compinit=1
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
fpath+=$HOME/.zsh/pure
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Case insensitive matching when no results found
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# syntax highlighting
if [ -d $HOME/.zsh/zsh-syntax-highlighting ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "Syntax highlighting not installed"
fi


# --------------- Pure Prompt -----------

zstyle :prompt:pure:git:dirty color yellow
zstyle :prompt:pure:path color blue
zstyle :prompt:pure:prompt:success color green
prompt pure

# --------------- ENV  ------------------

export EDITOR=vim
export _JAVA_AWT_WM_NONREPARENTING=1

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

# --------------- Aliases --------------- 
#
alias ls='ls --color=auto'
alias rspec='rspec --color'
alias npm-exec='PATH=$(npm bin):$PATH'
alias sound='alsamixer'
alias gitc='git checkout'
alias gitp='git pull'
alias gitmk='git checkout -b'
alias gits='git status'
alias gitd='git diff --color=always | less -r'
alias clipin='xclip -i -sel clip'
calc() { printf "%s\n" "$*" | bc -l } 
alias desktop="startx"

alias journal="vim ~/.ios-notes/journal.md"

source ~/.dotfiles/notesrc

# -------------- Terminal Settings -----
stty -ixon


# -------------- TTY Colors  -----
#
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01f1f1f" #black
    echo -en "\e]P8505050" #darkgrey
    echo -en "\e]P1b33f52" #darkred
    echo -en "\e]P9b33f52" #red
    echo -en "\e]P272b165" #darkgreen
    echo -en "\e]PA72b165" #green
    echo -en "\e]P3d7d957" #brown
    echo -en "\e]PBd7d957" #yellow
    echo -en "\e]P4576aca" #darkblue
    echo -en "\e]PC576aca" #blue
    echo -en "\e]P5b757ca" #darkmagenta
    echo -en "\e]PDb757ca" #magenta
    echo -en "\e]P657cab7" #darkcyan
    echo -en "\e]PE57cab7" #cyan
    echo -en "\e]P7e7e7e7" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

#antigen
# source ~/.dotfiles/antigen/bin/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle colored-man-pages
# antigen bundle docker
# antigen bundle docker-compose

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme agnoster

# Tell Antigen that you're done.
# antigen apply

if [ -f "$HOME/.zshrc-local" ]; then
    source "$HOME/.zshrc-local"
fi
