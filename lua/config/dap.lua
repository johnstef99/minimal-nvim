local M = {}

local dap = require("dap")
local api = vim.api
local keymap_restore = {}

function M.mapKWhenActive()
  dap.listeners.after['event_initialized']['me'] = function()
    for _, buf in pairs(api.nvim_list_bufs()) do
      local keymaps = api.nvim_buf_get_keymap(buf, 'n')
      for _, keymap in pairs(keymaps) do
        if keymap.lhs == "K" then
          table.insert(keymap_restore, keymap)
          api.nvim_buf_del_keymap(buf, 'n', 'K')
        end
      end
    end
    api.nvim_set_keymap(
      'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
  end

  dap.listeners.after['event_terminated']['me'] = function()
    for _, keymap in pairs(keymap_restore) do
      api.nvim_buf_set_keymap(
        keymap.buffer,
        keymap.mode,
        keymap.lhs,
        keymap.rhs,
        { silent = keymap.silent == 1 }
      )
    end
    keymap_restore = {}
  end
end

function M.init()
  dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
    name = 'lldb',
  }
  dap.configurations.c = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
    }
  }

  M.mapKWhenActive()
end

return M
