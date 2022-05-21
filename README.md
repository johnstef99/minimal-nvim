# !(Minimal) Nvim

It was supposed to be a minimal nvim config but because I'm using vim as my
main editor for basically everything this config isn't minimal anymore.
_Centered around flutter and web developer._

![](images/cover.png)
Image Features:

- Find references and definitions
- Info on hover
- Fuzzy finder
- Autocomplete

## Pre-requirements

- **recommended version of nvim v0.7 or higher**
- npm (for most of the LSP servers)

## Features

- Native LSP
- File browser
- Status line with icons and git branch
- Buffers tabs with icons

## Quickstart

1. Clone this repo to your nvim config directory
2. Make sure you have [vim-plug](https://github.com/junegunn/vim-plug) installed
3. Run `:PlugInstall` inside nvim
4. You may need to configure some of the language servers in `lua/config.lua`
   to set the correct path for the executable (you will get an error when an
   executable is not found)
