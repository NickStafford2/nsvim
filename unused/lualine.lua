-- statusline
return {
	"nvim-lualine/lualine.nvim",
	opts = function(_, opts)
		local LazyVim = require("lazyvim.util")

		-- Customize lualine_c (your file path)
		opts.sections.lualine_c = {
			{
				LazyVim.lualine.pretty_path({
					length = 0,
					relative = "cwd",
					modified_hl = "MatchParen",
					directory_hl = "",
					filename_hl = "Bold",
					modified_sign = "",
					readonly_icon = " 󰌾 ",
				}),
			},
		}

		opts.sections.lualine_z = {}
	end,
}
