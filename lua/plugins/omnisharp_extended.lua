return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    ft = "cs",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local omnisharp_ext = require "omnisharp_extended"

      -- Setup OmniSharp với handler fix metadata URI
      vim.lsp.config("omnisharp", {
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
        handlers = {
          ["textDocument/definition"] = omnisharp_ext.handler,
          ["textDocument/typeDefinition"] = omnisharp_ext.handler,
          ["textDocument/implementation"] = omnisharp_ext.handler,
        },
      })

      -- Keymaps
      local keymap = vim.keymap.set
      keymap("n", "gd", omnisharp_ext.lsp_definition, { desc = "Goto Definition (C#)" })
      keymap("n", "gr", omnisharp_ext.lsp_references, { desc = "Goto References (C#)" })
      keymap("n", "gi", omnisharp_ext.lsp_implementation, { desc = "Goto Implementation (C#)" })
    end,
  },
}
