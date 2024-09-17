require('lspsaga').setup({})
local lsp_config = require('lspconfig')
local util = require('lspconfig/util')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require('cmp_nvim_lsp').on_attach

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
        vim.keymap.set('n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<leader>dc', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', '<leader>imp', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', '<leader>typ', '<cmd>Lspsaga peek_type_definition<cr>', opts)
        vim.keymap.set('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', '<leader>sig', '<cmd>lua vim.lsp.buf.signature()<cr>', opts)
        vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set('n', '<leader>fmt', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
        vim.keymap.set('n', '<leader>fx', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', '<leader>K', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
        vim.keymap.set('n', '<leader>dia', '<cmd>lua vim.diagnostic.open_float() <cr>', opts)
    end
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local default_setup = function(server)
    lsp_config[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd','lua_ls', 'omnisharp', 'rust_analyzer', 'gopls', 'zls', 'ols' },
    handlers = {default_setup}
})

lsp_config.zls.setup({
    on_attach = on_attach,
    capabilities = lsp_capabilities,
    cmd = {"/home/sylvain/repos/zls/zig-out/bin/zls"},
    filetypes = {"zig", "zon"},
    root_dir = util.root_pattern("zls.json", "build.zig", ".git")
})

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
