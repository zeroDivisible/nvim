-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guifont = { "Berkeley Mono", ":h20:b" }

-- pipe mostly used for external integrations with the editor (from within Godot, etc)
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"

if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end
