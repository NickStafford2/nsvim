return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		event_handlers = {
			-- When entering Neo-tree window: turn on relative numbers
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.number = true
					vim.opt_local.relativenumber = true
				end,
			},

			-- When leaving Neo-tree window: turn OFF relative numbers
			{
				event = "neo_tree_buffer_leave",
				handler = function()
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
				end,
			},
		},
	},
}
