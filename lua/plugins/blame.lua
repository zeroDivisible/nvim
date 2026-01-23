return {
  -- allows showing blame in virtual buffer, etc
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<cr>", desc = "Git Blame (virtual mode)" },
      { "<leader>gB", "<cmd>BlameToggle window<cr>", desc = "Git Blame (window mode)" },
    },
    opts = {},
  },

  -- this plugin is not used for displaying inline blame / commit messages but only for
  -- an easy way to jump to the remote for a particular file
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
