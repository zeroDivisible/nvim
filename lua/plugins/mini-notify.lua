return {
  -- mini.notify owns vim.notify directly (noice is disabled).
  {
    "nvim-mini/mini.notify",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      local notify = require("mini.notify")
      notify.setup(opts)
      vim.notify = notify.make_notify()
    end,
    keys = {
      { "<leader>n", function() require("mini.notify").show_history() end, desc = "Notification History" },
      { "<leader>un", function() require("mini.notify").clear() end, desc = "Dismiss All Notifications" },
    },
  },
}
