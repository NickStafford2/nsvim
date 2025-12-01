return {
	"folke/which-key.nvim",
	opts = {
		-- Sometimes which-key misses some keymaps. add them here
		-- Add missing <leader>s group entries
		defaults = {
			["<leader>s"] = { name = "+search" },

			["<leader>sn"] = { "<cmd>Noice history<cr>", "Noice History" },
			["<leader>ss"] = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Document Symbols" },
			["<leader>sS"] = {
				"<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
				"Workspace Symbols",
			},
		},
	},
}
