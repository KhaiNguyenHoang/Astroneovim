---@type LazySpec
return {
  "Fildo7525/pretty_hover",
  event = "LspAttach",
  opts = {},
  config = function(_, opts)
    require("pretty_hover").setup(opts)

    -- map key K để gọi pretty_hover thay cho hover mặc định
    local map = require("astrocore").map
    map("n", "K", function() require("pretty_hover").hover() end, { desc = "Toggle pretty hover" })
  end,
}
