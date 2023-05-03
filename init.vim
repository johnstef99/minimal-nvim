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
else
  if(has('nvim'))
    function InstallPlug()
      call system('sh -c "curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"')
    endfunction
  endif
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
syntax enable
set background=dark
set keymap=greek_utf-8
set iminsert=0 imsearch=-1
set laststatus=3

runtime ./maps.vim
runtime ./config.vim
