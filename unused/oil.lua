return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true, -- replaces netrw
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		{ "<leader>e", "<cmd>Oil<CR>", desc = "Oil Explorer" },
	},
}
