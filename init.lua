if vim.loader then
	vim.loader.enable()
end

-- Debug function
_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

-- Core LazyVim + plugin loader
require("config.lazy")

-- Optional: final custom code (keep VERY minimal)
-- require("lspconfig").glsl_analyzer.setup({})
