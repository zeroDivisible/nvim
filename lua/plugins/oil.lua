return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      restore_win_options = true,
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      view_options = {
        show_hidden = false,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      win_options = {
        wrap = true,
      },
    },
    keys = {
      { "<leader>o", "<cmd>Oil --float<cr>", desc = "Oil" },
    },
  },
}
