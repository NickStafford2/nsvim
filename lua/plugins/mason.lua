return {
	"williamboman/mason.nvim",
	opts = function(_, opts)
		vim.list_extend(opts.ensure_installed, {
			"stylua",
			"selene",
			"luacheck",
			"shellcheck",
			"shfmt",
			"tailwindcss-language-server",
			"typescript-language-server",
			"css-lsp",
			"pyright", -- pyright for Python LSP
			"basedpyright", -- basedpyright for Python LSP
			"ruff", -- ruff for linting
			"black", -- black for auto-formatting
			"isort", -- isort for sorting imports
		})
	end,
}
