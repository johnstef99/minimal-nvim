require("config.lsp").init()
require("config.cmp").init()
require("config.null_ls").init()
require("config.lualine").init()
require("config.tree_sitter").init()
require("config.barbar").init()
require("config.dap").init()
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
require("telescope").setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 90 }
    },
  },
})
require("telescope").load_extension("ui-select")
require("fidget").setup()
