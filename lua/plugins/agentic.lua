-- Agentic.nvim: ACP chat panel for Claude Code and omp.
-- Both backends are ACP-compatible: `claude-agent-acp` (npm adapter) and
-- `omp acp` (built-in). Switch between them mid-session with <localLeader>s.
return {
  init = function()
    -- <C-c> in any agentic chat panel buffer interrupts the running agent.
    -- Buffer-local, so the global <C-c> (visual-block, InsertLeave) is untouched.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "AgenticChat", "AgenticInput", "AgenticCode", "AgenticTodos", "AgenticFiles", "AgenticDiagnostics" },
      callback = function(args)
        vim.keymap.set({ "n", "i" }, "<C-c>", function()
          require("agentic").stop_generation()
        end, { buffer = args.buf, desc = "Agentic: stop generation" })
      end,
    })
  end,
  "carlos-algms/agentic.nvim",
  opts = function()
    -- Default to omp if installed; otherwise fall back to Claude.
    local provider = vim.fn.executable("omp") == 1 and "pi-acp" or "claude-agent-acp"
    return {
      provider = provider,
      acp_providers = {
        -- Override the built-in pi-acp slot to use `omp acp` (omp speaks ACP
        -- natively; the default pi-acp command is a separate adapter for a
        -- different "pi" agent that isn't installed here).
        ["pi-acp"] = {
          name = "Oh My Pi",
          command = "omp",
          args = { "acp" },
        },
      },
      windows = {
        position = "right",
        width = "40%",
      },
      keymaps = {
        widget = {
          -- Work in insert mode too (from the prompt buffer), not just normal.
          -- Tradeoff: pressing `\` in the prompt makes nvim wait for
          -- timeoutlen before inserting a literal backslash. Acceptable for
          -- chat prompts where backslashes are rare.
          switch_provider = { { "<localLeader>s", mode = { "n", "i" } } },
          switch_model = { { "<localLeader>m", mode = { "n", "i" } } },
          change_thought_level = { { "<localLeader>t", mode = { "n", "i" } } },
          open_options = { { "<localLeader>o", mode = { "n", "i" } } },
        },
      },
    }
  end,
  keys = {
    { "<leader>aa", function() require("agentic").toggle() end, mode = { "n", "v" }, desc = "Agentic: toggle chat" },
    { "<leader>an", function() require("agentic").new_session() end, mode = { "n", "v" }, desc = "Agentic: new session" },
    { "<leader>ar", function() require("agentic").restore_session() end, mode = { "n", "v" }, desc = "Agentic: restore session" },
    { "<leader>af", function() require("agentic").add_selection_or_file_to_context() end, mode = { "n", "v" }, desc = "Agentic: add file/selection to context" },
    { "<leader>ad", function() require("agentic").add_current_line_diagnostics() end, mode = "n", desc = "Agentic: add line diagnostics" },
    { "<leader>aD", function() require("agentic").add_buffer_diagnostics() end, mode = "n", desc = "Agentic: add buffer diagnostics" },
    { "<leader>as", function() require("agentic").stop_generation() end, mode = "n", desc = "Agentic: stop generation (fallback)" },
  },
}
