require('rose-pine').setup({
    variant = 'auto',
    dark_variant = 'main',
    bold_vertical_split = true,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = true,
    disable_italics = true,

    highlight_groups = {
        ['@field'] = { link = '@variable'},
        ['@property'] = { link = '@variable'},
    }
})

vim.cmd('colorscheme rose-pine')
