local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Makes it pretty
    {'rose-pine/neovim', name = 'rose-pine'},
    {'nvim-treesitter/nvim-treesitter'},
    {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons', opt = true}},

    -- LSP Stuffs
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
    {'nvimdev/lspsaga.nvim'},

    -- QOL
    {'windwp/nvim-autopairs', event = 'InsertEnter', opts = {}},

    -- File browsing
    {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}}
})
