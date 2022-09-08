require("config.lsp").init()
require("config.cmp").init()
require("config.null_ls").init()
require("config.lualine").init()
require("config.tree_sitter").init()
require("config.barbar").init()
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".*.pdf" },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})
require("telescope").load_extension("ui-select")
