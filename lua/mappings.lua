require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


map("n", "<Space><Space>", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope live grep" })
