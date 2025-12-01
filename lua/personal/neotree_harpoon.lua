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

-- Automatically close Harpoon pane when Neo-tree closes
vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(event)
		-- get the window that closed
		local closed_win = tonumber(event.match)
		if not closed_win then
			return
		end

		local buf = vim.api.nvim_win_get_buf(closed_win)
		if vim.bo[buf].filetype ~= "neo-tree" then
			return -- Not a Neo-tree window, ignore
		end

		-- Neo-tree closed → close any harpoonlist windows
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local b = vim.api.nvim_win_get_buf(win)
			if vim.bo[b].filetype == "harpoonlist" then
				vim.api.nvim_win_close(win, true)
			end
		end
	end,
})
return M
