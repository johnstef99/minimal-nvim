local M = {}

local saga = require("lspsaga")

function M.init()
	saga.init_lsp_saga({
		error_sign = "",
		warn_sign = "",
		hint_sign = "",
		infor_sign = "",
		border_style = "round",
	})
end

return M
