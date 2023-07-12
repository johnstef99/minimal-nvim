local loaded, lualine = pcall(require, "lualine")
if not loaded then
	return
end

lualine.setup({
	options = { theme = "onedark" },
	extensions = { "fugitive" },
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
