return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    require("harpoon"):setup({ settings = { save_on_toggle = true } })
  end,
  keys = {
    {
      "<leader>H",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon File",
    },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Menu",
    },
  },
}
