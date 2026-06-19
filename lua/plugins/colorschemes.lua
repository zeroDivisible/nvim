return {
  {
    "DeviusVim/deviuspro.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "oskarnurm/koda.nvim",
  },
  {
    "miikanissi/modus-themes.nvim",
  },
  {
    "noahfrederick/vim-hemisu",
    config = function()
      -- hemisu hardcodes gui=italic on Comment; strip it while keeping the color
      local function unitalicize()
        local c = vim.api.nvim_get_hl(0, { name = "Comment" })
        c.italic = false
        vim.api.nvim_set_hl(0, "Comment", c)
      end
      vim.api.nvim_create_autocmd("ColorScheme", { pattern = "hemisu", callback = unitalicize })
      if vim.g.colors_name == "hemisu" then
        unitalicize()
      end
    end,
  },
  {
    "vimcolorschemes/olive-crt.nvim",
  },
  {
    "bluz71/vim-moonfly-colors",
  },
  {
    "scottmckendry/cyberdream.nvim",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "datsfilipe/vesper.nvim",
    opts = {
      transparent = false,
      italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
      },
    },
  },
  {
    "ayu-theme/ayu-vim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
  },
}
