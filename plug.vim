call plug#begin()

" nvim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'commit': '33eb472b459f1d2bf49e16154726743ab3ca1c6d'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/conform.nvim'
Plug 'akinsho/flutter-tools.nvim'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/cmp-treesitter'

" ui related
Plug 'morhetz/gruvbox'
Plug 'ribru17/bamboo.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ap/vim-css-color'
Plug 'romgrk/doom-one.vim'
Plug 'j-hui/fidget.nvim', {'tag': 'legacy'}
Plug 'folke/which-key.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'folke/zen-mode.nvim'

Plug 'nvim-tree/nvim-tree.lua' |
    \ Plug 'nvim-tree/nvim-web-devicons'

" utils
Plug 'dbeniamine/cheat.sh-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'romainl/vim-cool'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lervag/vimtex'
Plug 'vim-scripts/AdvancedSorters'
Plug 'inkarkat/vim-ingo-library'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/vim-easy-align'
Plug 'nicwest/vim-camelsnek'

" Laravel
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" snippets
Plug 'Nash0x7E2/awesome-flutter-snippets' 
Plug 'rafamadriz/friendly-snippets'

" go
Plug 'fatih/vim-go'

" arm
Plug 'johnstef99/arm-syntax-vim'

" debugging
Plug 'mfussenegger/nvim-dap'

Plug 'github/copilot.vim'

" rust
Plug 'rust-lang/rust.vim'

" clojure
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'PaterJason/cmp-conjure'
Plug 'Olical/conjure'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'guns/vim-sexp'

call plug#end()
