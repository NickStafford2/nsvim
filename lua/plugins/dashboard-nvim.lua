return {
	"nvimdev/dashboard-nvim",
	lazy = false, -- Ensure dashboard is not lazy-loaded
	opts = function(_, opts)
		-- Your custom logo
		local custom_logo = [[

      ___           ___           ___                       ___     
     /\__\         /\  \         /\__\          ___        /\__\    
    /::|  |       /::\  \       /:/  /         /\  \      /::|  |   
   /:|:|  |      /:/\ \  \     /:/  /          \:\  \    /:|:|  |   
  /:/|:|  |__   _\:\~\ \  \   /:/__/  ___      /::\__\  /:/|:|__|__ 
 /:/ |:| /\__\ /\ \:\ \ \__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\
 \/__|:|/:/  / \:\ \:\ \/__/  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /
     |:/:/  /   \:\ \:\__\    |:|__/:/  /  \::/__/           /:/  / 
     |::/  /     \:\/:/  /     \::::/__/    \:\__\          /:/  /  
     /:/  /       \::/  /       ~~~~         \/__/         /:/  /   
     \/__/         \/__/                                   \/__/    
      
    ]]

		-- Ensure the logo has proper newlines for formatting
		custom_logo = string.rep("\n", 8) .. custom_logo .. "\n\n"

		-- Override only the header (logo) part
		opts.config.header = vim.split(custom_logo, "\n")

		return opts
	end,
}
