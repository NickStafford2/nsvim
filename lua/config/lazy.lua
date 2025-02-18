local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "solarized-osaka",
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},
		-- Linting
		{ import = "lazyvim.plugins.extras.linting.eslint" },

		-- Formatting
		{ import = "lazyvim.plugins.extras.formatting.black" },
		-- { import = "lazyvim.plugins.extras.formatting.biome" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },

		-- Languages
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.toml" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.git" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.docker" },
		-- { import = "lazyvim.plugins.extras.lang.markdown" },

		-- UI/UX
		{ import = "lazyvim.plugins.extras.ui.mini-animate" },
		{ import = "lazyvim.plugins.extras.ui.dashboard-nvim" },
		{ import = "lazyvim.plugins.extras.ui.mini-indentscope" },
		{ import = "lazyvim.plugins.extras.ui.treesitter-context" },
		-- { import = "lazyvim.plugins.extras.ui.edgy" },

		-- Coding
		{ import = "lazyvim.plugins.extras.coding.mini-surround" },
		{ import = "lazyvim.plugins.extras.coding.neogen" },
		{ import = "lazyvim.plugins.extras.coding.yanky" },
		-- blink seems to be legit. switch from nvim-cmp to blink asap
		-- { import = "lazyvim.plugins.extras.coding.blink" },
		-- { import = "lazyvim.plugins.extras.coding.copilot" },

		-- Editor
		{ import = "lazyvim.plugins.extras.editor.outline" },
		{ import = "lazyvim.plugins.extras.editor.fzf" },
		{ import = "lazyvim.plugins.extras.editor.refactoring" },
		-- { import = "lazyvim.plugins.extras.editor.inc-rename" },
		{ import = "lazyvim.plugins.extras.editor.dial" },
		{ import = "lazyvim.plugins.extras.editor.navic" },
		-- { import = "lazyvim.plugins.extras.editor.mini-files" },

		-- LSP and DAP
		{ import = "lazyvim.plugins.extras.lsp.none-ls" },
		{ import = "lazyvim.plugins.extras.dap.core" },

		-- Utilities
		{ import = "lazyvim.plugins.extras.util.dot" },
		{ import = "lazyvim.plugins.extras.editor.telescope" },
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		-- { import = "lazyvim.plugins.extras.util.project" },

		-- Other
		-- { import = "lazyvim.plugins.extras.test.core" },
		-- { import = "lazyvim.plugins.extras.vscode" },

		-- Non LazyExtras
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	dev = {
		path = "~/.ghq/github.com",
	},
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},
	debug = false,
})
