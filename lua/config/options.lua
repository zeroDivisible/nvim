-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Don't show tabs/trailing whitespace
vim.opt.list = false
vim.opt.scrolloff = 15

-- No horizontal scroll jump (keeps blink ghost_text from shifting the window).
vim.opt.sidescrolloff = 0
vim.opt.sidescroll=0

vim.opt.showmode = false

-- Format-on-save off; use <leader>cf, or toggle with <leader>uf / <leader>uF.
vim.g.autoformat = false

-- Neovim's built-in message UI (nvim 0.12+). Keeps the native cmdline row (set_cmdheight=false).
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    target = "cmd", -- classic cmdline (options: cmd, msg)
    -- Errors route to the ephemeral bottom-right window; everything else (saves, search counts) stays in the cmdline.
    targets = {
      emsg = "msg",
      echoerr = "msg",
      lua_error = "msg",
      rpc_error = "msg",
    },
    pager = { height = 1 },
    msg = { height = 0.5, timeout = 4500 },
    dialog = { height = 0.5 },
    cmd = { height = 0.5 },
  },
})

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = false
