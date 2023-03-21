local loaded, null_ls = pcall(require, "null-ls")
if not loaded then
	return
end

local on_attach = require("lsp.on_attach")
local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.pint.with({
		command = vim.fn.stdpath("data") .. "/mason/bin/pint",
	}),
}

null_ls.setup({ sources = sources, on_attach = on_attach })
