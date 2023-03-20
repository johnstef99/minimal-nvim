"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   _       _               _        ____               _             "
"  (_) ___ | |__  _ __  ___| |_ ___ / _\ \   _ ____   _(_)_ __ ___    "
"  | |/ _ \| '_ \| '_ \/ __| __/ _ \ |_ \ \ | '_ \ \ / / | '_ ` _ \   "
"  | | (_) | | | | | | \__ \ ||  __/  _| \ \| | | \ V /| | | | | | |  "
" _/ |\___/|_| |_|_| |_|___/\__\___|_|    \_\_| |_|\_/ |_|_| |_| |_|  "
"|__/                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if(!empty(globpath(&rtp, 'autoload/plug.vim')))
  runtime ./plug.vim
endif

let mapleader = ' '
let maplocalleader = '\'
set ignorecase
set mouse=a
set nowrap
set relativenumber
set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set hidden
set updatetime=300
set signcolumn=yes " always show signcolumns
set noswapfile
set expandtab " always uses spaces instead of tab characters
silent! colorscheme doom-one
let g:doom_one_terminal_colors = v:true
syntax enable
set termguicolors
set background=dark
" hi Normal guibg=NONE ctermbg=NONE
set keymap=greek_utf-8
set iminsert=0 imsearch=-1
set laststatus=3

runtime ./maps.vim
runtime ./config.vim

if has('nvim')
  lua require("lsp")
endif
