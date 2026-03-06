-- lua/personal/harpoonSidebar.lua
local M = {}

local harpoon = require("harpoon")

local buf -- our custom buffer
local win -- optional: remember window

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
		buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].bufhidden = "wipe"
		vim.bo[buf].swapfile = false
		vim.bo[buf].filetype = "harpoonlist"

		-- basic mappings inside this buffer
		vim.keymap.set("n", "<CR>", function()
			local line = vim.api.nvim_win_get_cursor(0)[1]
			harpoon:list():select(line)
		end, { buffer = buf, nowait = true, silent = true })

		vim.keymap.set("n", "r", function()
			render()
		end, { buffer = buf, nowait = true, silent = true })

		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	end

	-- open a window if needed
	if not win or not vim.api.nvim_win_is_valid(win) then
		vim.cmd("vsplit")
		win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_width(win, 35)
	end

	vim.api.nvim_win_set_buf(win, buf)
	render()
end

return M
