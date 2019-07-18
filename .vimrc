call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jeffkreeftmeijer/vim-dim'

call plug#end()

colorscheme dim

set nocompatible

nnoremap <silent> `t :NERDTree<CR><C-w>l

set number
set showcmd
set splitright
set splitbelow

syntax enable

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

