if true then
	return {}
end

return {
	"personal/solarized-osaka.nvim",
	lazy = true,
	priority = 1000,
	opts = function()
		return {
			transparent = true,
		}
	end,
}
