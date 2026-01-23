return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      exclude_dirs = { "~/.cargo/*" },
    })
  end,
}
