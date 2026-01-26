return {
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
}
