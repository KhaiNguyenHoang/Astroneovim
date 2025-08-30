---@type LazySpec
return {
  "yetone/avante.nvim",
  optional = true,
  enabled = true,
  opts = {
    behaviour = {
      auto_suggestions = false,
      enable_cursor_planning_mode = false,
      enable_token_counting = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
      enable_claude_text_editor_tool_mode = false,
    },
    suggestion = {
      debounce = 600,
      throttle = 1000,
    },
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
    disabled_tools = {},
    auto_suggestions_provider = nil,
    providers = {
      openrouter = {
        __inherited_from = "openai", -- bắt buộc để Avante nhận provider custom
        endpoint = "https://openrouter.ai/api/v1/chat/completions",
        model = "deepseek/deepseek-chat-v3.1",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
        headers = {
          ["Authorization"] = "Bearer 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",
        },
      },
    },
    provider = "openrouter",
    rag_service = {
      enabled = false,
      host_mount = os.getenv "HOME" .. "/git",
      runner = "docker",
      llm = {
        provider = "openrouter",
        endpoint = "https://openrouter.ai/api/v1/chat/completions",
        api_key = "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",
        model = "deepseek/deepseek-chat-v3.1",
      },
      embed = {
        provider = "openai",
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        api_key = "AIzaSyC3ncnx_yAwjnCdfaH534LCYCIK9fRvJcA",
        model = "gemini-embedding-exp-03-07",
      },
      docker_extra_args = "",
    },
  },
  specs = {
    -- thêm nvim-cmp sources hoặc blink.cmp nếu muốn
  },
}
