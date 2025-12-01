return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		view_options = { show_hidden = true },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		{ "<leader>e", false }, -- disable Oil stealing <leader>e
	},
}
