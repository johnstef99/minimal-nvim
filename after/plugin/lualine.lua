local loaded, lualine = pcall(require, "lualine")
if not loaded then
	return
end

lualine.setup({
	options = { theme = "gruvbox" },
	extensions = { "fugitive" },
})
