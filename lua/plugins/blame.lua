return {
  -- Blame toggle (virtual / window).
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<cr>", desc = "Git Blame (virtual mode)" },
      { "<leader>gB", "<cmd>BlameToggle window<cr>", desc = "Git Blame (window mode)" },
    },
    opts = {},
  },

  -- Jump to remote file/commit URL in the browser.
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gor", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open Remote @ main" },
      { "<leader>goc", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit Changing Line" },
    },
    opts = {
      enabled = false,
    },
  },
}
