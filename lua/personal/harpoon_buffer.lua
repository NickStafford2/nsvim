-- lua/personal/harpoon_buffer.lua
local M = {}

local harpoon = require("harpoon")
local buf

local function render()
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		return
	end

	local list = harpoon:list()
	local lines = {}

	for i, item in ipairs(list.items) do
		local name = vim.fn.fnamemodify(item.value, ":t")
		table.insert(lines, string.format("%d  %s", i, name))
	end

	vim.bo[buf].modifiable = true
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].modifiable = false
end

M.render = render

function M.open()
	if not buf or not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, false)
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].bufhidden = "hide"
		vim.bo[buf].swapfile = false
		vim.bo[buf].filetype = "harpoonlist"
		vim.bo[buf].modifiable = false
		vim.bo[buf].readonly = true

		-- No keymaps that manipulate Harpoon or open files.
		-- Optional: manual refresh
		vim.keymap.set("n", "r", function()
			render()
		end, { buffer = buf, silent = true })
	end

	vim.api.nvim_win_set_buf(0, buf)
	render()
end

-- Auto-refresh whenever you enter the harpoon sidebar window
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		if buf and vim.api.nvim_buf_is_valid(buf) and args.buf == buf then
			render()
		end
	end,
})

return M
