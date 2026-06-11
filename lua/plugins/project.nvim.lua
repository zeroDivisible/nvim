return {
  "DrKJeff16/project.nvim",
  config = function()
    require("project").setup({
      exclude_dirs = { "~/.cargo/*" },
    })
  end,
}
