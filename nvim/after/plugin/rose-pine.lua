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
        ['Constant'] = normal,
        ['Function'] = func,
        ['String'] = literal,
        ['Number'] = literal,
        ['Float'] = literal,
        ['Keyword'] = keyword,
        ['Type'] = type,
        ['Structure'] = type,
        ['Include'] = {link = 'keyword'},

        -- Treesitter 
        ['@variable'] = {link = 'Normal'},
        ['@punctuation'] = {link = 'Normal'},
        ['@parameter'] = {link = '@variable'},
        ['@field'] = {link = '@variable'},
        ['@property'] = {link = '@field'},

        ['@method'] = {link = 'Function'},
        ['@function.builtin'] = {link = 'Function'},

        -- csharp specific
        ['@variable.c_sharp'] = {link = '@variable'},
        ['@type.qualifier.c_sharp'] = {link = 'Keyword'},
        ['@type.builtin.c_sharp'] = {link = 'Keyword'},
        ['@storageclass.c_sharp'] = {link = 'Keyword'},
        ['@punctuation.delimiter.c_sharp'] = {link = 'Normal'},
        ['@punctuation.bracket.c_sharp'] = {link = 'Normal'},

        -- zig specific
        ['@lsp.type.namespace.zig'] = {link = '@viarable'},
        ['@variable.builtin.zig'] = {link = '@variable'},
        ['@constant.builtin.zig'] = {link = '@variable'},
        ['@lsp.type.keywordliteral.zig'] = {link = 'Keyword'},
    }
})

vim.cmd('colorscheme rose-pine')
