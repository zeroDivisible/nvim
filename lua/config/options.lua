-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Don't show tabs/trailing whitespace
vim.opt.list = false
vim.opt.scrolloff = 15

-- below two disable jumping window when blink ghost_text is too long for narrow windws.
vim.opt.sidescrolloff = 0
vim.opt.sidescroll=0

vim.opt.showmode = false

-- No format-on-save; format manually with <leader>cf. Toggle back on per-buffer
-- with <leader>uf or globally with <leader>uF.
vim.g.autoformat = false

-- Neovim's built-in message UI (nvim 0.12+). Unlike noice it attaches with
-- set_cmdheight=false, so the native cmdline keeps its row.
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    target = "cmd", -- default: classic cmdline. options: cmd, msg
    -- errors go to the ephemeral bottom-right window instead; everything else
    -- (:w confirmations, search counts, ...) stays quietly in the cmdline
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
