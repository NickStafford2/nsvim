-- lua/personal/neotree_harpoon.lua
local M = {}

function M.open_with_harpoon()
	-- 1. Open Neo-tree on the left
	vim.cmd("Neotree toggle left")

	-- 2. Find the Neo-tree window
	local neotree_win = nil
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "neo-tree" then
			neotree_win = win
			break
		end
	end

	if not neotree_win then
		return
	end

	-- 3. Focus the Neo-tree window
	vim.api.nvim_set_current_win(neotree_win)

	-- 4. Create a split BELOW Neo-tree
	vim.cmd("belowright split")

	-- 5. Correct height of the Harpoon pane
	vim.cmd("resize 15")

	-- 6. Put your custom Harpoon buffer inside that split
	require("personal.harpoon_buffer").open()
end

return M
