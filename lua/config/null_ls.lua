local M = {}

local null_ls = require("null-ls")
local lsp = require("lspconfig")

local on_attach = require("config.lsp.on_attach")
local sources = {
	null_ls.builtins.formatting.stylua,
}

function M.init()
	null_ls.config({ sources = sources })
	lsp["null-ls"].setup({
		on_attach = on_attach,
	})
end

return M
