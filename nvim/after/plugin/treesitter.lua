local config = require('nvim-treesitter.configs')
local parsers = require "nvim-treesitter.parsers"

local parser_config = parsers.get_parser_configs()

parser_config.haxe = {
    install_info = {
        url = "https://github.com/vantreeseba/tree-sitter-haxe",
        files = {"src/parser.c"},
        branch = "main"
    },
    filetype = "haxe"
}

config.setup({
    ensure_installed = {'c', 'cpp','c_sharp', 'haxe', 'lua', 'rust', 'zig'},
    auto_install = false,

    highlight = {
        enable = true,
    }
})
