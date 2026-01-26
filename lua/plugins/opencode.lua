return {
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "opencode_output" },
      },
      "saghen/blink.cmp", -- for completion
      "folke/snacks.nvim", -- for picker
    },
    config = function()
      require("opencode").setup({
        preferred_picker = "snacks",
        preferred_completion = "blink",
        default_global_keymaps = true,
        keymap_prefix = "<leader>a", -- AI prefix to avoid conflict with oil.nvim
        keymap = {
          editor = {
            ["<leader>ag"] = { "toggle", desc = "Toggle OpenCode" },
            ["<leader>ai"] = { "open_input", desc = "Open input" },
            ["<leader>aI"] = { "open_input_new_session", desc = "Open input (new session)" },
            ["<leader>ao"] = { "open_output", desc = "Open output" },
            ["<leader>at"] = { "toggle_focus", desc = "Toggle focus" },
            ["<leader>aT"] = { "timeline", desc = "Timeline picker" },
            ["<leader>aq"] = { "close", desc = "Close OpenCode" },
            ["<leader>as"] = { "select_session", desc = "Select session" },
            ["<leader>aR"] = { "rename_session", desc = "Rename session" },
            ["<leader>ap"] = { "configure_provider", desc = "Switch provider/model" },
            ["<leader>aV"] = { "configure_variant", desc = "Switch model variant" },
            ["<leader>az"] = { "toggle_zoom", desc = "Toggle zoom" },
            ["<leader>av"] = { "paste_image", desc = "Paste image" },
            ["<leader>ad"] = { "diff_open", desc = "Open diff view" },
            ["<leader>a]"] = { "diff_next", desc = "Next file diff" },
            ["<leader>a["] = { "diff_prev", desc = "Previous file diff" },
            ["<leader>ac"] = { "diff_close", desc = "Close diff view" },
            ["<leader>ara"] = { "diff_revert_all_last_prompt", desc = "Revert all (last prompt)" },
            ["<leader>art"] = { "diff_revert_this_last_prompt", desc = "Revert this (last prompt)" },
            ["<leader>arA"] = { "diff_revert_all", desc = "Revert all (session)" },
            ["<leader>arT"] = { "diff_revert_this", desc = "Revert this (session)" },
            ["<leader>arr"] = { "diff_restore_snapshot_file", desc = "Restore file to snapshot" },
            ["<leader>arR"] = { "diff_restore_snapshot_all", desc = "Restore all to snapshot" },
            ["<leader>ax"] = { "swap_position", desc = "Swap pane position" },
            ["<leader>att"] = { "toggle_tool_output", desc = "Toggle tool output" },
            ["<leader>atr"] = { "toggle_reasoning_output", desc = "Toggle reasoning output" },
            ["<leader>a/"] = { "quick_chat", mode = { "n", "x" }, desc = "Quick chat" },
          },
          input_window = {
            ["<S-cr>"] = { "submit_input_prompt", mode = { "n", "i" }, desc = "Submit prompt" },
            ["<esc>"] = { "close", desc = "Close" },
            ["<C-c>"] = { "cancel", desc = "Cancel request" },
            ["~"] = { "mention_file", mode = "i", desc = "Mention file" },
            ["@"] = { "mention", mode = "i", desc = "Mention" },
            ["/"] = { "slash_commands", mode = "i", desc = "Slash commands" },
            ["#"] = { "context_items", mode = "i", desc = "Context items" },
            ["<M-v>"] = { "paste_image", mode = "i", desc = "Paste image" },
            ["<C-i>"] = { "focus_input", mode = { "n", "i" }, desc = "Focus input" },
            ["<tab>"] = { "toggle_pane", mode = { "n", "i" }, desc = "Toggle pane" },
            ["<up>"] = { "prev_prompt_history", mode = { "n", "i" }, desc = "Previous prompt" },
            ["<down>"] = { "next_prompt_history", mode = { "n", "i" }, desc = "Next prompt" },
            ["<M-m>"] = { "switch_mode", desc = "Switch mode" },
            ["<M-r>"] = { "cycle_variant", mode = { "n", "i" }, desc = "Cycle variant" },
          },
          output_window = {
            ["<esc>"] = { "close", desc = "Close" },
            ["<C-c>"] = { "cancel", desc = "Cancel request" },
            ["]]"] = { "next_message", desc = "Next message" },
            ["[["] = { "prev_message", desc = "Previous message" },
            ["<tab>"] = { "toggle_pane", mode = { "n", "i" }, desc = "Toggle pane" },
            ["i"] = { "focus_input", "n", desc = "Focus input" },
            ["<M-r>"] = { "cycle_variant", mode = { "n" }, desc = "Cycle variant" },
            ["<leader>aS"] = { "select_child_session", desc = "Select child session" },
            ["<leader>aD"] = { "debug_message", desc = "Debug message" },
            ["<leader>aO"] = { "debug_output", desc = "Debug output" },
            ["<leader>ads"] = { "debug_session", desc = "Debug session" },
          },
        },
        ui = {
          position = "right",
          input_position = "bottom",
          window_width = 0.40,
          zoom_width = 0.8,
          input_height = 0.15,
          display_model = true,
          display_context_size = true,
          display_cost = true,
          icons = {
            preset = "nerdfonts",
          },
          output = {
            tools = {
              show_output = true,
              show_reasoning_output = true,
            },
          },
        },
        context = {
          enabled = true,
          cursor_data = {
            enabled = false,
            context_lines = 5,
          },
          diagnostics = {
            info = false,
            warn = true,
            error = true,
            only_closest = false,
          },
          current_file = {
            enabled = true,
            show_full_path = true,
          },
          files = {
            enabled = true,
            show_full_path = true,
          },
          selection = {
            enabled = true,
          },
        },
      })
    end,
  },
}
