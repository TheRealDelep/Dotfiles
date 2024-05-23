require('rose-pine').setup({
    variant = 'auto',
    dark_variant = 'main',
    bold_vertical_split = false,
    dim_nc_background = true,
    disable_background = true,
    disable_float_background = true,
    disable_italics = false,

    highlight_groups = {
        ['@variable.member'] = {link = 'Normal'},

        ['@lsp.type.namespace.cs'] = {link = 'Normal'}

    }
})

vim.cmd('colorscheme rose-pine')
