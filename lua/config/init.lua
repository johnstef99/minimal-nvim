require("config.lsp").init()
require("config.cmp").init()
require("config.null_ls").init()
require("config.lualine").init()
require("config.tree_sitter").init()
require("telescope").setup{
  defaults = {
    file_ignore_patterns = {".*.pdf"}
  }
}
