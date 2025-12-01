return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false, -- load immediately
	priority = 1000, -- load before everything else
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		require("solarized-osaka").setup(opts)
		-- LazyVim will automatically apply your colorscheme
	end,
}
