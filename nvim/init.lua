
local opt = vim.opt
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.hlsearch = true
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append('@-@')

opt.updatetime = 50
vim.opt.fillchars = { eob = ' ' }

require('config')
--vim.cmd('SymbolsOutline')

opt.termguicolors = true
