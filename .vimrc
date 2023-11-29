call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jeffkreeftmeijer/vim-dim', { 'branch': 'main' }
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'

call plug#end()


set nocompatible

" Key mapping

let mapleader = "`"

map <Leader>h :set hlsearch!<CR>

nnoremap <silent> <Leader>t :NERDTree<CR><C-w>l
noremap <silent> <Leader>cc :norm ^i# <CR>
noremap <silent> <Leader>cu :norm ^xx<CR>
command W w
command Q q
command Wq wq
command WQ wq
noremap <silent> <Leader>y "+y
noremap <silent> <Leader>p "+p

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

set pastetoggle=<F3>

" Clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Information
set number
set showcmd

" Splitting
set splitright
set splitbelow

" Indentation
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" Auto line breaks
set wrap
set linebreak

" Searching
set ignorecase
set smartcase

" Syntax and Colors
set t_Co=16
set background=dark
colorscheme dim
syntax enable

hi colorcolumn ctermbg=8

" Buffers
set hidden
set autoread

" Navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set scrolloff=10

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

let g:ackprg = 'ag --nogroup --nocolor --column'

" disable bells
set noeb
set vb
set t_vb=

