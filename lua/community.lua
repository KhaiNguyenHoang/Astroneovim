-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Bars and Lines
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },

  -- Comment
  { import = "astrocommunity.comment.ts-comments-nvim" },

  -- Completion
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  -- { import = "astrocommunity.completion.codeium-nvim" },

  -- Debugging
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  -- Diagnostics
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },

  -- Editing Support
  { import = "astrocommunity.editing-support.codecompanion-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.conform-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.mcphub-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.vector-code-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- Git
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },
  { import = "astrocommunity.git.octo-nvim" },

  -- Icon
  { import = "astrocommunity.icon.mini-icons" },

  -- Indent
  { import = "astrocommunity.indent.indent-blankline-nvim" },

  -- LSP
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.nvim-lint" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  -- Markdown and LaTeX
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  -- Media
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.media.vim-wakatime" },

  -- Motion
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  { import = "astrocommunity.motion.vim-matchup" },

  -- Note Taking
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- Language Packs
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cs-omnisharp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.nginx" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },

  -- Project
  { import = "astrocommunity.project.project-nvim" },

  -- Quickfix
  { import = "astrocommunity.quickfix.nvim-bqf" },

  -- Recipes
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.vscode-icons" },
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },

  -- Scrolling
  { import = "astrocommunity.scrolling.mini-animate" },

  -- Search
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },
  { import = "astrocommunity.search.nvim-spectre" },

  -- Snippet
  { import = "astrocommunity.snippet.mini-snippets" },

  -- Syntax
  { import = "astrocommunity.syntax.vim-easy-align" },

  -- Test
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },

  -- Utility
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.utility.lua-json5" },
  { import = "astrocommunity.utility.noice-nvim" },
}
