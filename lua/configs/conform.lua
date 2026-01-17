local options = {
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
  },
  formatters = {
    ["clang-format"] = {
      -- Force NvChad to use your manually downloaded binary
      command = vim.fn.expand("~/.local/bin/clang-format"),
    },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
