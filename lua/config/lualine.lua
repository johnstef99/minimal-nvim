local M = {}

local lualine = require("lualine")

function M.init()
	lualine.setup({
		options = { theme = "gruvbox" },
		extensions = { "fugitive" },
	})
end

return M
