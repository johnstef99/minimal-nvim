-- LSP {{{
--TODO: make seperate files
local lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local cmp = require("cmp")
local null_ls = require("null-ls")
local treesitter = require("nvim-treesitter.configs")
local lualine = require("lualine")
local saga = require 'lspsaga'
local set = vim.opt

-- LSPSAGA setup {{{
saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
--- }}}

-- Custom reuseable on_attach method{{{
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap('i', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
	buf_set_keymap("n", "<space>a", "<cmd>Lspsaga code_action<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	buf_set_keymap("n", "<space>l", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
	buf_set_keymap("n", "<S-C-j>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end
--}}}

-- NVIM-CMP setup {{{
-- some vim options
set.completeopt = "menu,menuone,noselect"
set.lazyredraw = true

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<M-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"]() == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = "calc" },
      { name = "treesitter" },
    },
  })
-- }}}

-- NULL_LS setup {{{
-- register null_ls sources
local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.eslint,
}
null_ls.config({ sources = sources })
lsp["null-ls"].setup({})
-- }}}

-- specific languages lsp setup {{{

-- javascript, typescript {{{
lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
--}}}

-- css {{{
lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
--}}}

-- vim {{{
lsp.vimls.setup({
	capabilities = capabilities,
})
--}}}

-- lua {{{
lsp.sumneko_lua.setup({
	cmd = { "lua-language-server", "-E", "/Users/johnstef/.local/bin/main.lua" },
	capabilities = capabilities,
})
--}}}

-- html {{{
lsp.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.cmd("autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync()")
--}}}

-- json {{{
lsp.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
--}}}
--}}}

-- Treesitter setup {{{
treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
-- }}}

-- }}}

-- LUALINE setup {{{
lualine.setup {
  options = {theme = 'gruvbox'},
  extensions = {'fugitive'}
}
-- }}}

--------------------------------------------------
-- vim: set foldmethod=marker foldlevel=0:
