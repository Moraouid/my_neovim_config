
return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy", -- optional, loads plugin lazily
  opts = {
    -- optional configuration
    -- For example, you can pass:
    -- client_id = "your_custom_discord_client_id",
    -- logo = "nvim", -- options: "nvim", "neovim", etc.
  },
}
