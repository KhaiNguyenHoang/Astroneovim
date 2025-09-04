---@type LazySpec
return {
  "folke/lazydev.nvim",
  optional = true,
  opts = {
    library = {
      -- Load yazi types library
      { path = os.getenv "HOME" .. "/.config/yazi/plugins/types.yazi", words = { "ya%." } },
    },
  },
}
