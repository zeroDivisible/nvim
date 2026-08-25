-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guifont = { "Berkeley Mono", ":h24:b" }

-- add keys for resizing UI.
if vim.g.neovide then
  local function resize_font(delta)
    local size = tonumber(vim.o.guifont:match(":h(%d+)"))
    if size then
      vim.o.guifont = vim.o.guifont:gsub(":h%d+", ":h" .. (size + delta))
    end
  end

  local mod = vim.fn.has("mac") == 1 and "D" or "C"
  vim.keymap.set("n", "<" .. mod .. "-=>", function() resize_font(1) end)
  vim.keymap.set("n", "<" .. mod .. "-->", function() resize_font(-1) end)
end

-- pipe mostly used for external integrations with the editor (from within Godot, etc)
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"

if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end
