local M = {}

local treesitter = require("nvim-treesitter.configs")

function M.init()
	treesitter.setup({
		highlight = {
			enable = true,
			disable = {},
		},
		indent = {
			enable = true,
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
			"scss",
		},
	})

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
	-- fold based on treesitter
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldmethod = "expr"
	vim.opt.foldenable = false
end

return M
