return {
	{
		"mfussenegger/nvim-dap",
		opts = function()
			local dap = require("dap")

			-- Disable stopping on thrown exceptions globally unless you explicitly enable it.
			dap.defaults.fallback.exception_breakpoints = {}

			-- If you want to be extra explicit for codelldb:
			dap.defaults.codelldb = dap.defaults.codelldb or {}
			dap.defaults.codelldb.exception_breakpoints = {}
		end,
	},
}
