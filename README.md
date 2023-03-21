# !(Minimal) Nvim

It was supposed to be a minimal nvim config but because I'm using vim as my
main editor for basically everything this config isn't minimal anymore.

## Features
- Native nvim lsp using [mason](https://github.com/williamboman/mason.nvim) for
easy lsp server installation.
- Keybindings for Documentation on hover, Autocomplete, Go to definition, Find
references, Rename using lsp
- Fuzzy finder using
[Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Git integration using [vim-fugitive](https://github.com/tpope/vim-fugitive)
- File explorer using [NERDTree](https://github.com/preservim/nerdtree)
- Syntax highlighting using [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Requirements

- **recommended version of nvim v0.8 or higher**
- gcc (for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter))
- git (for [vim-plug](https://github.com/junegunn/vim-plug))
- npm (for most of the LSP servers)

## Quickstart

1. Clone this repo to your nvim config directory.
2. If you don't already have [vim-plug](https://github.com/junegunn/vim-plug)
   installed, you can run `:call InstallPlug()`.
3. Run `:PlugInstall` inside nvim.
4. Check `:messages` for any error (if there are no messages you are good to
   go).
