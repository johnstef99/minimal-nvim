local loaded, treesitter = pcall(require, "nvim-treesitter.configs")
if not loaded then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = { "dart" },
	},
	ensure_installed = {
		"lua",
		"vim",
	},
	ignore_install = {},
	modules = {},
	sync_install = false,
	auto_install = false,
	parser_install_dir = nil,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
-- fold based on treesitter
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
