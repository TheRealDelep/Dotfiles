vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>/', ':noh<cr>')

vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-N>')

Term_buf_id = nil
vim.keymap.set('n', '<leader>t', function() 
    if (Term_buf_id) then
        vim.cmd(string.format(':b%d', Term_buf_id))
    else
        vim.cmd(':term')
        Term_buf_id = vim.fn.bufnr()
    end
end)
