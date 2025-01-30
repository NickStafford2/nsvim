if true then
	return {}
end
return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = { "catppuccin", "solarized-osaka", "gruvbox", "tokyonight", "habamax" }, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
