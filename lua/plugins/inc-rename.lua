-- return { "saecki/live-rename.nvim" }
return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()
	end,
}
