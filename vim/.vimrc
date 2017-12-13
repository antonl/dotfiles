"
" VIM Configuration 
"

" set shell to bash
set shell=/bin/sh
set encoding=utf-8

" Turn off compatible mode
set nocompatible
filetype off

" Add vimplugging
call plug#begin('~/.vim/plugged')

Plug 'ajh17/VimCompletesMe'
Plug 'alexpearce/gruvbox'

call plug#end()

" Remap leader to comma
let mapleader=","

" Quick editing of vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" No shift, I'm a wild man
nnoremap ; :
nnoremap <silent> <leader>o :only<cr>

" Navigate tabs with arrow keys
noremap <silent> <Left> :tabp<CR>
noremap <silent> <Right> :tabn<CR>

noremap <F4> :set hlsearch! hlsearch?<CR>

" Turn off <F1> help mapping
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Automatically save upon alt-tab
au FocusLost * :wa

set mouse=""        " Turns off all mouse use
set hidden          " Don't close buffers, hide them instead  
set textwidth=79    " Don't automatically break long lines
set wrap
set whichwrap+=<,>,h,l
set ttyfast
set scrolloff=3

set tabstop=2
set softtabstop=2
set shiftwidth=2    " number of spaces to use for autoindenting
set expandtab       " Soft tabs (spaces instead of tab characters)
set colorcolumn=85

set autoindent      " set autoindenting
set copyindent      " copy indenting on copy/paste

" Faster window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use bs to delete everything
set backspace=indent,eol,start

set number          " Show line numbers
set relativenumber
set numberwidth=2
set ruler

set showmatch       " highlight matching brackets
set mat=2           " How many tenths of a second to blink

set hlsearch    " highlight search items
set incsearch   " search as you type
set gdefault
set smartcase   " if mixed case, use case when searching

set showmode
set showcmd             " show commands as they're typed
set laststatus=2
set cursorline

" No sound on errors
set visualbell
set t_vb=

" Lots of history
set history=10000
set undolevels=10000
set undofile

" Disable swap/backups
set nobackup
set noswapfile

set ffs=unix,dos,mac "Default file types
syntax enable

set t_Co=256
set background=dark
"set termguicolors
colorscheme gruvbox

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the curors - when moving vertical..

set wildmenu "Turn on WiLd menu
set cmdheight=2 "The commandbar height
set magic "Set magic on, for regular expressions
