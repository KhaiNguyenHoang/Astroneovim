---@type LazySpec
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    -- Provider configuration
    provider = "openrouter",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1/chat/completions", -- FIXED
        model = "deepseek/deepseek-chat-v3.1",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
        headers = {
          ["Authorization"] = "Bearer " .. (os.getenv "OPENROUTER_API_KEY" or ""),
        },
      },
    },

    -- Behavior settings
    behaviour = {
      auto_suggestions = false,
      enable_cursor_planning_mode = false,
      enable_token_counting = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
      enable_claude_text_editor_tool_mode = false,
    },

    -- UI/Windows configuration
    windows = {
      position = "right",
      wrap = true,
      width = 50,
      sidebar_header = {
        enabled = true,
        align = "center",
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8,
      },
      edit = {
        border = "rounded",
        start_insert = true,
      },
      ask = {
        floating = false,
        start_insert = true,
        border = "rounded",
        focus_on_apply = "ours",
      },
    },

    -- Advanced features
    disabled_tools = {},
    auto_suggestions_provider = nil,
    rag_service = {
      enabled = false,
      host_mount = os.getenv "HOME" .. "/git",
      runner = "docker",
      llm = {
        provider = "openrouter",
        endpoint = "https://openrouter.ai/api/v1/chat/completions", -- FIXED
        api_key = os.getenv "OPENROUTER_API_KEY" or "",
        model = "deepseek/deepseek-chat-v3.1",
      },
      embed = {
        provider = "openai",
        endpoint = "https://generativelanguage.googleapis.com/v1beta",
        api_key = os.getenv "GOOGLE_API_KEY" or "",
        model = "embedding-001",
      },
      docker_extra_args = "",
    },
  },

  -- Essential dependencies only
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },

  init = function()
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    map("n", "<leader>aa", "<cmd>AvanteAsk<cr>", vim.tbl_extend("force", opts, { desc = "Avante: Ask" }))
    map("n", "<leader>ar", "<cmd>AvanteRefresh<cr>", vim.tbl_extend("force", opts, { desc = "Avante: Refresh" }))
    map("v", "<leader>aa", "<cmd>AvanteAsk<cr>", vim.tbl_extend("force", opts, { desc = "Avante: Ask (visual)" }))
    map("n", "<leader>at", "<cmd>AvanteToggle<cr>", vim.tbl_extend("force", opts, { desc = "Avante: Toggle" }))
  end,
}
