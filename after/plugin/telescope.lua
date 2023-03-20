local loaded, telescope = pcall(require, "telescope")
if not loaded then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = { ".*.pdf" },
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = 90 },
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

telescope.load_extension("ui-select")
