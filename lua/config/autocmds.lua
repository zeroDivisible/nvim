-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local snacks_windows = {}
    local floating_windows = {}
    local windows = vim.api.nvim_list_wins()
    for _, w in ipairs(windows) do
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(w) })
      if filetype:match("snacks_") ~= nil then
        table.insert(snacks_windows, w)
      elseif vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_windows, w)
      end
    end
    if 1 == #windows - #floating_windows - #snacks_windows then
      for _, w in ipairs(snacks_windows) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Keep the blink.cmp docs window as wide as the menu (minus its border).
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuPositionUpdate',
  callback = function()
    local ok_menu, menu = pcall(require, 'blink.cmp.completion.windows.menu')
    if not ok_menu or not menu.win then return end
    local ok_docs, docs = pcall(require, 'blink.cmp.completion.windows.documentation')
    if not ok_docs or not docs.win then return end
    if not (menu.win:is_open() and docs.win:is_open()) then return end
    local target = menu.win:get_width() - docs.win:get_border_size().horizontal
    if target > 0 then docs.win:set_width(target) end
  end,
})
