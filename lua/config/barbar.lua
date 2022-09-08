local M = {}

local barbar = require("bufferline")

function M.init()
  barbar.setup({
    auto_hide = true,
    closable = false,
  })
end

return M
