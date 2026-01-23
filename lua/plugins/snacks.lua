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
    },
  },
}
