" Plugins "{{{
call plug#begin()

" nvim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" ui related
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim' " TODO: set keymaps for barbar
Plug 'shadmansaleh/lualine.nvim'

" utils
Plug 'dbeniamine/cheat.sh-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
"}}}

" Vim settings "{{{
let mapleader = " "
set ignorecase
set mouse=a
set nowrap
set relativenumber
set nu
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set hidden
set updatetime=300
"set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns
set noswapfile
set expandtab " always uses spaces instead of tab characters
colorscheme gruvbox
syntax enable
set termguicolors
set background=dark
hi Normal guibg=NONE ctermbg=NONE
"}}}

" Telescope {{{
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}

" Nerdtree {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>
" }}}

" Lua settings {{{
lua require'config'
"}}}

"-----------------------------------------
" vim: set foldmethod=marker foldlevel=0:
