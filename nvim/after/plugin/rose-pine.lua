local normal = { fg = 'text' }
local func = { fg = 'iris' }
local literal = { fg = 'rose' }
local keyword = { fg = 'pine' }
local type = { fg = 'foam' }

require('rose-pine').setup({
    variant = 'auto',
    dark_variant = 'main',
    bold_vertical_split = true,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = true,
    disable_italics = true,

    highlight_groups = {
        ['Normal'] = normal,
        ['Operator'] = normal,
        ['Function'] = func,
        ['String'] = literal,
        ['Number'] = literal,
        ['Float'] = literal,
        ['Keyword'] = keyword,
        ['Type'] = type,
        ['Structure'] = type,
        ['Include'] = {link = 'keyword'},

        ['@variable'] = {link = 'Normal'},
        ['@parameter'] = {link = '@variable'},
        ['@field'] = {link = '@variable'},
        ['@property'] = {link = '@field'},

        ['@method'] = {link = 'Function'},

        -- csharp specific
        ['@variable.c_sharp'] = {link = '@variable'},
        ['@type.qualifier.c_sharp'] = {link = 'Keyword'},
        ['@type.builtin.c_sharp'] = {link = 'Keyword'},
        ['@storageclass.c_sharp'] = {link = 'Keyword'},
        ['@punctuation.delimiter.c_sharp'] = {link = 'Normal'},
        ['@punctuation.bracket.c_sharp'] = {link = 'Normal'},
    }
})

vim.cmd('colorscheme rose-pine')
