-- lua/personal/harpoon_buffer.lua
local M = {}

local harpoon = require("harpoon")
local buf

local function render()
	local list = harpoon:list()
	local lines = {}

	for i, item in ipairs(list.items) do
		table.insert(lines, string.format("%d: %s", i, item.value))
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

function M.open()
	-- create buffer if needed
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].bufhidden = "wipe"
		vim.bo[buf].swapfile = false
		vim.bo[buf].filetype = "harpoonlist"

		-- mappings inside the Harpoon buffer
		vim.keymap.set("n", "<CR>", function()
			local line = vim.api.nvim_win_get_cursor(0)[1]
			harpoon:list():select(line)
		end, { buffer = buf, nowait = true, silent = true })

		vim.keymap.set("n", "r", render, { buffer = buf, nowait = true, silent = true })
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	end

	-- use current window; neotree_harpoon already created the split
	vim.api.nvim_win_set_buf(0, buf)
	render()
end

return M
