return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,          -- load early so colors & modules are available
  priority = 1000,
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require("solarized-osaka").setup(opts)
    -- LazyVim will run :colorscheme solarized-osaka for us
  end,
}
