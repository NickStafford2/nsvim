if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
require("polish")
require("lspconfig").glsl_analyzer.setup({})
-- require("lspconfig").clangd.setup({})
