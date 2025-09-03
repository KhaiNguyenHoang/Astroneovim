local prefix = "<Leader>A"

---@type LazySpec
return {
  "olimorris/codecompanion.nvim",
  optional = true,
  dependencies = {
    "ravitemer/codecompanion-history.nvim",
    { "ravitemer/mcphub.nvim", optional = true },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        opts.mappings = opts.mappings or { n = {}, v = {} }
        opts.mappings.n[prefix .. "h"] = { "<cmd>CodeCompanionHistory<cr>", desc = "Open history" }
        opts.mappings.v[prefix .. "s"] = { "<cmd>CodeCompanionSummaries<cr>", desc = "Browse summaries" }
      end,
    },
  },
  opts = {
    extensions = {
      history = {
        enabled = true,
        opts = {
          auto_save = true,
          dir_to_save = vim.fn.stdpath "data" .. "/codecompanion-history",
          summary = { generation_opts = { context_size = 90000, include_references = true } },
        },
      },
    },

    adapters = {
      http = {
        qwen = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "Qwen3",
            env = {
              url = "https://openrouter.ai/api",
              api_key = "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",
            },
            headers = {
              Accept = "application/json",
              ["Content-Type"] = "application/json",
            },
            schema = { model = { default = "qwen/qwen3-coder" } },
          })
        end,

        -- Gemini adapter (Google AI Studio)
        gemini = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "Gemini 2.0 Flash",
            env = {
              url = "https://generativelanguage.googleapis.com/v1beta/openai/",
              api_key = "AIzaSyDHqLlb4KisWenh9Hm7bxS-HkHB-AZYFRU",
            },
            headers = {
              Accept = "application/json",
              ["Content-Type"] = "application/json",
            },
            schema = { model = { default = "gemini-2.0-flash" } },
          })
        end,
      },
      -- Qwen adapter (OpenRouter)
    },

    strategies = {
      chat = { adapter = "qwen" },
      inline = { adapter = "qwen" },
      cmd = { adapter = "qwen" },
    },
    display = {
      chat = {
        intro_message = "Welcome to CodeCompanion ✨!\n Press ? for options",
        separator = "─", -- The separator between the different messages in the chat buffer
        show_context = true, -- Show context (from slash commands and variables) in the chat buffer?
        show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
        show_settings = false, -- Show LLM settings at the top of the chat buffer?
        show_token_count = true, -- Show the token count for each response?
        show_tools_processing = true, -- Show the loading message when tools are being executed?
        start_in_insert_mode = false, -- Open the chat buffer in insert mode?
      },
    },
  },
}
