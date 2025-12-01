return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = false },
		---@type lspconfig.options
		servers = {
			cssls = {},
			-- tailwindcss = {
			-- 	root_dir = function(...)
			-- 		return require("lspconfig.util").root_pattern(".git")(...)
			-- 	end,
			-- },
			-- tsserver = {
			-- 	root_dir = function(...)
			-- 		return require("lspconfig.util").root_pattern(".git")(...)
			-- 	end,
			-- 	single_file_support = false,
			-- 	settings = {
			-- 		typescript = {
			-- 			inlayHints = {
			-- 				includeInlayParameterNameHints = "literal",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayVariableTypeHints = false,
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayEnumMemberValueHints = true,
			-- 			},
			-- 		},
			-- 		javascript = {
			-- 			inlayHints = {
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayEnumMemberValueHints = true,
			-- 			},
			-- 		},
			-- 	},
			-- },
			html = {},
			yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			},
			lua_ls = {
				-- enabled = false,
				single_file_support = true,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						misc = {
							parameters = {
								-- "--log-level=trace",
							},
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							-- enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			},
			-- clangd = {
			-- 	keys = {
			-- 		{ "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
			-- 	},
			-- 	root_markers = {
			-- 		"compile_commands.json",
			-- 		"compile_flags.txt",
			-- 		"configure.ac", -- AutoTools
			-- 		"Makefile",
			-- 		"configure.ac",
			-- 		"configure.in",
			-- 		"config.h.in",
			-- 		"meson.build",
			-- 		"meson_options.txt",
			-- 		"build.ninja",
			-- 		".git",
			-- 	},
			-- 	capabilities = {
			-- 		offsetEncoding = { "utf-16" },
			-- 	},
			-- 	cmd = {
			-- 		"clangd",
			-- 		"--background-index",
			-- 		"--clang-tidy",
			-- 		"--header-insertion=iwyu",
			-- 		"--completion-style=detailed",
			-- 		"--function-arg-placeholders",
			-- 		"--fallback-style=llvm",
			-- 	},
			-- 	init_options = {
			-- 		usePlaceholders = true,
			-- 		completeUnimported = true,
			-- 		clangdFileStatus = true,
			-- 	},
			-- },
		},
		-- setup = {
		-- clangd = function(_, opts)
		--   local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
		--   require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
		--   return false
		-- end,
		-- },
	},
}
