require('nvim-treesitter.configs').setup({
    ensure_installed = {'c', 'cpp','c_sharp', 'lua', 'rust', 'zig'},
    auto_install = false,

    highlight = {
        enable = true,
    }
})
