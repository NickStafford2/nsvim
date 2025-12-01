return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	opts = {
		fzf_bin = "sk", -- use Rust skim instead of fzf
		file_ignore_patterns = { "names.json" },
		winopts = {
			preview = { vertical = "down:40%" },
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word Under Cursor" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
	},
}
