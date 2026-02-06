return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = false,
      },
      picker = {
        layout = {
          preset = "vertical", -- list on top, preview on bottom
          layout = {
            height = 0.85,
            width = 0.85,
          },
          preview = {
            height = 0.7, -- 70% for preview, 30% for list
          },
        },
        sources = {
          explorer = {
            trash = true,
            hidden = true,
            layout = {
              preset = "sidebar",
              preview = false,
              layout = { width = 0.3 },
            },
          },
        },
      },
      -- Additional modules
      bigfile = { enabled = true },
      zen = { enabled = true },
      scratch = { enabled = true },
      words = { enabled = true },
      rename = { enabled = true },
      -- Disable indent guides and animated scope line entirely
      indent = { enabled = false },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
      { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
      { "<leader>'", function() Snacks.picker.resume() end, desc = "Resume last picker" },
    },
  },
}
