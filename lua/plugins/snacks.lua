return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = false,
      },
      -- terminal env (ZELLIJ=0) is set per-call in plugins/terminal.lua, not here.
      -- Setting it here makes Snacks.terminal.get/open compute different tids
      -- (get uses raw opts, open merges this config), breaking Snacks.lazygit
      -- and any Snacks.terminal call that doesn't pass env explicitly.
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
          files = {
            matcher = { frecency = true },
          },
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
        previewers = {
          -- With difftastic configured as a git tool, we need to ensure `terminal` diff
          -- style, otherwise the diff won't take the whole output window.
          diff = { style = "terminal" },
        },
      },
      -- Additional modules
      notifier = { enabled = false }, -- mini.notify owns vim.notify instead
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
