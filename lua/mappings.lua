require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Format the current file with Ctrl+Shift+i in Normal and Insert modes
map({ "n", "i" }, "<C-S-i>", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file with Clang-Format" })

map("n", "<Space><Space>", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })
