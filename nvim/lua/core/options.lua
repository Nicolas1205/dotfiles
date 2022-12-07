local opt = vim.opt
local g = vim.g

opt.confirm = true 
opt.title   = true 
opt.clipboard = "unnamedplus" 
opt.laststatus = 3
opt.completeopt = "menuone,noinsert,noselect"
vim.o.ls=0 
opt.cmdheight=0


-- Indentation

opt.updatetime = 500
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true


opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers

opt.number = true
opt.relativenumber = true 
opt.ruler = false

-- Leader Key

g.mapleader = " "


local default_plugins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

vim.cmd [[set termguicolors]]

for _, plugin in pairs(default_plugins) do 
	g["loaded_" .. plugin] = 1
end
