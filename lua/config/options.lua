local opt = vim.opt
local g = vim.g

-- Python provider (your clean pyenv venv)
g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim/bin/python")

-- Disable providers you don't use
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Shell preference
opt.shell = "zsh"

-- Editing preferences
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- UI behavior
opt.scrolloff = 20
opt.splitbelow = true
opt.splitright = true

-- Command behavior
if vim.fn.has("nvim-0.8") == 1 then
	opt.cmdheight = 0
end

-- Comment continuation rules
opt.formatoptions:append("r")

-- Disable mouse if desired (LazyVim enables it by default)
opt.mouse = ""
