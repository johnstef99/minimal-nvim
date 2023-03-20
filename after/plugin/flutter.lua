local loaded, flutter = pcall(require, "flutter-tools")
if not loaded then
	return
end
local capabilities = require("lsp.cmp").capabilities
local on_attach = require("lsp.on_attach")

flutter.setup({
	debugger = {
		-- enabled = true,
		-- run_via_dap = true,
	},
	fvm = true,
	closing_tags = {
		enabled = false,
	},
	lsp = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})
