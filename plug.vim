call plug#begin()

" nvim lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
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
Plug 'nvim-lualine/lualine.nvim'
Plug 'ap/vim-css-color'
Plug 'romgrk/doom-one.vim'
Plug 'tribela/vim-transparent'
Plug 'j-hui/fidget.nvim'

" nerdtree
Plug 'preservim/nerdtree' |
  \ Plug 'ryanoasis/vim-devicons' | 
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'johnstef99/vim-nerdtree-syntax-highlight'

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

" Laravel
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
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

call plug#end()
