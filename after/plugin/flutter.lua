local loaded, flutter = pcall(require, "flutter-tools")
if not loaded then
	return
end

local cmp_lsp_loaded, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_lsp_loaded then
  return
end
local capabilities = cmp_lsp.default_capabilities()

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
