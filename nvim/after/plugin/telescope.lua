local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>grep', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ls', builtin.buffers, {})
vim.keymap.set('n', '<leader>hh', builtin.help_tags, {})

require('telescope').setup({})
