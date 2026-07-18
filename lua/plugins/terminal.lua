-- Terminal keymaps. Keys are merged by lazy.nvim into snacks.nvim.
-- TERM_ENV must match snacks.lua terminal.env: Snacks' tid hash includes env,
-- and get()/open() compute it at different merge stages, so omitting it makes
-- get() miss the window and re-create one.
local TERM_ENV = { ZELLIJ = "0" }
-- Root and cwd terminals live in distinct snacks "slots". snacks keys
-- terminals by a tid hashed from cmd/cwd/env/count; when vim's cwd equals the
-- project root, root and cwd would otherwise share a tid and `get()` would
-- reuse one window for both <leader>ft and <leader>fT. Pinning count keeps
-- them separate regardless of cwd.
local ROOT_COUNT, CWD_COUNT = 1, 2
local current_term ---@type snacks.win?

local function reveal(t)
  if t:valid() then
    t:focus()
  else
    t:show():focus()
  end
end

-- <C-/>: hide if focused, focus if open, else open at project root.
local function toggle_current()
  local t = current_term
  if t and t:valid() and vim.api.nvim_get_current_win() == t.win then
    t:hide()
  elseif t and t:buf_valid() then
    reveal(t)
  else
    -- get() reuses an existing root terminal (tid match), so a reload that
    -- nulled current_term doesn't orphan the old window.
    current_term = Snacks.terminal.get(nil, { cwd = LazyVim.root(), env = TERM_ENV, count = ROOT_COUNT })
    reveal(current_term)
  end
end

local function open_root()
  current_term = Snacks.terminal.get(nil, { cwd = LazyVim.root(), env = TERM_ENV, count = ROOT_COUNT })
  reveal(current_term)
end

local function open_cwd()
  current_term = Snacks.terminal.get(nil, { cwd = vim.fn.getcwd(), env = TERM_ENV, count = CWD_COUNT })
  reveal(current_term)
end

local function pick()
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
      current_term = t
      reveal(t)
    end
  end)
end

-- <leader>tm: move current terminal between bottom/right split.
-- wincmd resets tailing (restored via stopinsert+startinsert re-sync) and
-- window size (restored via t:dim() to match the split style's 40%).
local function move_position()
  local t = current_term
  if not (t and t:win_valid()) then
    return
  end
  local go_right = (t.opts.position or "bottom") ~= "right"
  t.opts.position = go_right and "right" or "bottom"
  vim.api.nvim_win_call(t.win, function()
    vim.cmd("wincmd " .. (go_right and "L" or "J"))
    local dim = t:dim()
    vim.cmd((go_right and "vertical resize " or "resize ") .. (go_right and dim.width or dim.height))
  end)
  if t.win == vim.api.nvim_get_current_win() then
    if vim.api.nvim_get_mode().mode == "t" then
      vim.cmd("stopinsert")
    end
    vim.cmd("startinsert")
  end
end

return {
  "folke/snacks.nvim",
  keys = {
    { "<C-/>",      toggle_current, mode = { "n", "t" }, desc = "Terminal (toggle current)" },
    { "<C-_>",      toggle_current, mode = { "n", "t" }, desc = "which_key_ignore" },
    { "<leader>ft", open_root,      desc = "Terminal (root)" },
    { "<leader>fT", open_cwd,       desc = "Terminal (cwd)" },
    { "<leader>fl", pick,           desc = "Terminals (list)" },
    { "<leader>tm", move_position,  mode = { "n", "t" }, desc = "Terminal: toggle bottom/right" },
  },
}
