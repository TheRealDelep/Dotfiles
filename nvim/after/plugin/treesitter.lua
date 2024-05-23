local config = require('nvim-treesitter.configs')

config.setup({
    ensure_installed = {'c', 'cpp','c_sharp', 'lua', 'rust', 'zig'},
    auto_install = true,

    highlight = {
        enable = true,
    }
})
