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
Plug 'akinsho/flutter-tools.nvim' " TODO: find a way to make extra configs optional

" ui related
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'shadmansaleh/lualine.nvim'
Plug 'tami5/lspsaga.nvim', {'branch': 'nvim51'}

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
Plug 'romainl/vim-cool'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'

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

" Sneak {{{
let g:sneak#label = 1
" }}}

" Lua settings {{{
lua require'config'
"}}}

" Barbar maps {{{
nnoremap <leader>bb :BufferPick<CR>
nnoremap gt :BufferNext<CR>
nnoremap gT :BufferPrevious<CR>
nnoremap <leader>bc :BufferClose<CR>
nnoremap <leader>bw :BufferWipeout<CR>
nnoremap <leader>bo :BufferCloseAllButCurrent<CR>
"}}}

" Maps {{{
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap spg :set spell spelllang=el<CR>
nmap spe :set spell spelllang=en<CR>
nmap spn :set nospell<CR>
" }}}

" Emmet {{{
if(has("mac"))
  let g:user_emmet_leader_key = '§'
  let g:user_emmet_expandabbr_key = '§§'
else
  let g:user_emmet_leader_key = '`'
  let g:user_emmet_expandabbr_key = '``'
endif
" }}}

"}}}

"-----------------------------------------
" vim: set foldmethod=marker foldlevel=0 foldenable:
