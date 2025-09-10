vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- -- Transparent background overrides
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NvimTreeToggle", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" })
--
--




-- clang setup
require('lspconfig').clangd.setup {
  filetypes = {"c"},
}

-- Autocommand to save the buffer on CursorHold and CursorHoldI
vim.g.gtags_executable = '/usr/bin/ctags'
vim.api.nvim_create_augroup('GtagsAutoCmds', { clear = true })
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  group = 'GtagsAutoCmds',
  pattern = '*',
  callback = function()
    if vim.bo.modified then  -- Check if the buffer is modified
      vim.cmd('silent! wa')  -- Save the buffer silently
    end
  end,
})

vim.g.c_formatter_42_set_equalprg = 1

-- Set up nvim-tree
-- require'nvim-tree'.setup {}

-- Map Ctrl + b to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- set tab to 4 space 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Set mapkeys for window resizing
vim.keymap.set("n", "<C-Left>", "<cmd>lua require('resize').ResizeLeft()<CR>", {silent=true})
vim.keymap.set("n", "<C-Right>", "<cmd>lua require('resize').ResizeRight()<CR>", {silent=true})
vim.keymap.set("n", "<C-Up>", "<cmd>lua require('resize').ResizeUp()<CR>", {silent=true})
vim.keymap.set("n", "<C-Down>", "<cmd>lua require('resize').ResizeDown()<CR>", {silent=true})



-- set up/Down full line  
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

return {
  NvimTreeNormal = { bg = "none" },
  NvimTreeNormalNC = { bg = "none" },
  NvimTreeEndOfBuffer = { bg = "none", fg = "none" },
}

