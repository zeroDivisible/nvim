-- Agentic.nvim: ACP chat panel for Claude Code and omp.
-- Both backends are ACP-compatible: `claude-agent-acp` (npm adapter) and
-- `omp acp` (built-in). Switch between them mid-session with <localLeader>s.
return {
  "carlos-algms/agentic.nvim",
  opts = {
    -- Default backend. Switch live in the chat with <localLeader>s.
    provider = "claude-agent-acp",
    acp_providers = {
      -- Oh My Pi speaks ACP natively via `omp acp`; not the `pi-acp` adapter
      -- (that's for a different "pi" agent). Override command/args to match.
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
  },
  keys = {
    { "<leader>aa", function() require("agentic").toggle() end, mode = { "n", "v", "i" }, desc = "Agentic: toggle chat" },
    { "<leader>an", function() require("agentic").new_session() end, mode = { "n", "v", "i" }, desc = "Agentic: new session" },
    { "<leader>ar", function() require("agentic").restore_session() end, mode = { "n", "v", "i" }, desc = "Agentic: restore session" },
    { "<leader>af", function() require("agentic").add_selection_or_file_to_context() end, mode = { "n", "v" }, desc = "Agentic: add file/selection to context" },
    { "<leader>ad", function() require("agentic").add_current_line_diagnostics() end, mode = "n", desc = "Agentic: add line diagnostics" },
    { "<leader>aD", function() require("agentic").add_buffer_diagnostics() end, mode = "n", desc = "Agentic: add buffer diagnostics" },
  },
}
