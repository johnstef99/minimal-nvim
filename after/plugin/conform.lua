local loaded, conform = pcall(require, "conform")
if not loaded then
	return
end

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
