return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- để có completion capabilities
    "folke/which-key.nvim", -- để hiện menu <space> l ...
    "Hoffs/omnisharp-extended-lsp.nvim", -- để fix lỗi metadata definition
  },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local wk = require "which-key"
    local omnisharp_ext = require "omnisharp_extended"

    -- Đăng ký group <leader>l cho which-key
    wk.register({
      l = { name = "LSP" },
    }, { prefix = "<leader>" })

    -- Setup OmniSharp
    lspconfig.omnisharp.setup {
      cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },

      enable_editorconfig_support = true,
      enable_ms_build_load_projects_on_demand = true,
      enable_roslyn_analyzers = true,
      enable_import_completion = true,
      organize_imports_on_format = true,
      sdk_include_prereleases = true,

      capabilities = capabilities,

      handlers = {
        ["textDocument/definition"] = omnisharp_ext.handler,
        ["textDocument/typeDefinition"] = omnisharp_ext.handler,
        ["textDocument/implementation"] = omnisharp_ext.handler,
      },

      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Điều hướng
        vim.keymap.set(
          "n",
          "gd",
          omnisharp_ext.lsp_definition,
          vim.tbl_extend("force", opts, { desc = "Go to Definition" })
        )
        vim.keymap.set("n", "gr", omnisharp_ext.lsp_references, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set(
          "n",
          "gi",
          omnisharp_ext.lsp_implementation,
          vim.tbl_extend("force", opts, { desc = "Implementation" })
        )

        -- Hover & signature
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Docs" }))
        vim.keymap.set(
          "n",
          "<C-k>",
          vim.lsp.buf.signature_help,
          vim.tbl_extend("force", opts, { desc = "Signature Help" })
        )

        -- Nhóm <leader>l
        vim.keymap.set(
          "n",
          "<leader>la",
          vim.lsp.buf.code_action,
          vim.tbl_extend("force", opts, { desc = "Code Action" })
        )
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
        vim.keymap.set(
          "n",
          "<leader>lf",
          function() vim.lsp.buf.format { async = true } end,
          vim.tbl_extend("force", opts, { desc = "Format Buffer" })
        )
      end,
    }
  end,
}
