local M = {}

local saga = require("lspsaga")

function M.init()
	saga.init_lsp_saga({
		code_action_prompt = {
			enable = false,
		},
	})
end

return M
