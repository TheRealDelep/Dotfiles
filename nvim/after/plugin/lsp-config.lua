require('lspsaga').setup({})
local lsp_config = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
        vim.keymap.set('n', '<leader>def', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<leader>dec', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', '<leader>imp', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', '<leader>typ', '<cmd>Lspsaga peek_type_definition<cr>', opts)
        vim.keymap.set('n', '<leader>ref', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', '<leader>sig', '<cmd>lua vim.lsp.buf.signature()<cr>', opts)
        vim.keymap.set('n', '<leader>ren', '<cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set('n', '<leader>fmt', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
        vim.keymap.set('n', '<leader>fix', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', '<leader>dia', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    end
})

local default_setup = function(server)
    lsp_config[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'lua_ls', 'omnisharp', 'rust_analyzer' },
    handlers = {default_setup}
})

lsp_config.zls.setup({})

local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete()
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
})
