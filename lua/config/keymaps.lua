-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "<C-G>", "<ESC>", { silent = true })

-- disable Ex mode (Q in Neovim replays last macro by default, which is useful)
vim.keymap.set("n", "gQ", "<Nop>", { silent = true, desc = "Disable Ex mode" })

-- buffer navigation (vim tab-like bindings)
vim.keymap.set("n", "gt", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "gT", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- clipboard (Cmd key mappings for GUI nvim)
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
vim.keymap.set("t", "<D-v>", "<C-R>+") -- Paste terminal mode

-- terminal: a single root-dir terminal with reliable toggle/focus.
-- We track the window ourselves (stable reference) instead of relying on
-- Snacks' cwd-based lookup, which spawns a new terminal when LazyVim.root()
-- resolves differently between the file and an already-open terminal.
--   no terminal open  -> open one at LazyVim.root()
--   focused inside it  -> hide it
--   open but elsewhere -> focus it
local root_term ---@type snacks.win?
local function toggle_root_term()
  if root_term and root_term:valid() and vim.api.nvim_get_current_win() == root_term.win then
    root_term:hide()
  elseif root_term and root_term:buf_valid() then
    root_term:show():focus()
  else
    root_term = Snacks.terminal.open(nil, { cwd = LazyVim.root() })
  end
end
vim.keymap.set({ "n", "t" }, "<C-/>", toggle_root_term, { desc = "Terminal (Root Dir)" })
vim.keymap.set({ "n", "t" }, "<C-_>", toggle_root_term, { desc = "which_key_ignore" })

-- terminal: move the terminal between the bottom and right split.
-- splits only apply their position when (re)created, so we mutate the stored
-- position then hide + show to relayout it.
vim.keymap.set({ "n", "t" }, "<leader>tm", function()
  if not (root_term and root_term:buf_valid()) then
    return
  end
  root_term.opts.position = root_term.opts.position == "right" and "bottom" or "right"
  root_term:hide()
  root_term:show():focus()
end, { desc = "Terminal: toggle bottom/right" })

-- terminal: pick from currently open terminals
vim.keymap.set("n", "<leader>fl", function()
  local terms = Snacks.terminal.list()
  if #terms == 0 then
    Snacks.notify.info("No open terminals")
    return
  end
  vim.ui.select(terms, {
    prompt = "Terminals",
    format_item = function(t)
      return vim.api.nvim_buf_get_name(t.buf)
    end,
  }, function(t)
    if t then
      t:show():focus()
    end
  end)
end, { desc = "Terminals (list)" })

-- Override LazyVim's stock <leader>ft / <leader>fT. Those route through
-- Snacks.terminal() -> toggle -> get, which asserts on a terminal id hashed
-- from raw opts (no env). Because our global terminal.env (ZELLIJ=0) is only
-- merged inside open, the ids disagree and get() raises "Terminal was not
-- created". Snacks.terminal.open has no such assert, so reuse our wrappers.
vim.keymap.set("n", "<leader>ft", toggle_root_term, { desc = "Terminal (Root Dir)" })

local cwd_term ---@type snacks.win?
vim.keymap.set("n", "<leader>fT", function()
  if cwd_term and cwd_term:valid() and vim.api.nvim_get_current_win() == cwd_term.win then
    cwd_term:hide()
  elseif cwd_term and cwd_term:buf_valid() then
    cwd_term:show():focus()
  else
    cwd_term = Snacks.terminal.open(nil, { cwd = vim.fn.getcwd() })
  end
end, { desc = "Terminal (cwd)" })
