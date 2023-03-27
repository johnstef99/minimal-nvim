vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true })
vim.g.copilot_no_tab_map = true
