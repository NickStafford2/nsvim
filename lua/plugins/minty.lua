if true then
	return {}
end
-- i don't know why i put each keys inside of these blocks instead of calling keymaps
-- I don't know what is best yet. or how to config nvim properly. this version works
--
-- I don't know how these are suppose return values to the buffer
return {
	{
		"nvchad/volt",
		lazy = true,
		keys = {
			{
				"<leader><F8>",
				function()
					require("minty.huefy").open({ border = true })
				end,
				desc = "minty huefy",
			},
		},
	},
	{ "nvchad/minty", lazy = true },
	keys = {
		{
			"<leader><F7>",
			function()
				require("minty.shades").open({ border = true })
			end,
			desc = "minty shades",
		},
	},
}
