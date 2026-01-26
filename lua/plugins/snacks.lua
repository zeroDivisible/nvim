return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = false,
      },
      picker = {
        sources = {
          explorer = {
            trash = true,
            hidden = true,
            layout = { preset = "sidebar", preview = false },
          },
        },
      },
      -- Additional modules
      bigfile = { enabled = true },
      zen = { enabled = true },
      scratch = { enabled = true },
      words = { enabled = true },
      rename = { enabled = true },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    },
  },
}
