return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      list = { selection = { preselect = false } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          max_width = 80,
          scrollbar = false,
          -- Lower thresholds so both n and s almost always qualify as "desired".
          -- The comparator then preserves this ordered list instead of
          -- re-ranking by raw space, which was flipping docs while typing.
          desired_min_width = 1,
          desired_min_height = 1,
          direction_priority = {
            menu_north = { 'n', 's' },
            menu_south = { 's', 'n' },
          },
        },
      },
      ghost_text = { enabled = true },
      menu = {
        scrollbar = false,
        draw = {
          align_to = 'cursor',
          components = {
            label = { width = { fill = true, max = 40 } },
            label_description = { width = { max = 20 } },
          },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        lua = { inherit_defaults = true, "lazydev" },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { 'exact', 'score', 'sort_text' },
    },
  },
  config = function(_, opts)
    require('blink.cmp').setup(opts)
    -- Match the docs window width to the menu width. The docs window uses a
    -- 'padded' border (horizontal=2) while the menu has none, so subtract it.
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
  end,
}
