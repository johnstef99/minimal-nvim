local M = {}

local null_ls = require("null-ls")
local on_attach = require("config.lsp.on_attach")
local sources = {}

function M.init()
  null_ls.setup({ sources = sources, on_attach = on_attach })
end

return M
