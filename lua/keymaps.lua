local opts = { noremap = true }

vim.keymap.set('n', '<C-e>', ':Explore<CR>')
vim.keymap.set('n', '<C-s>', ':w!<CR>')
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('n', '<C-q>', ':wqa<CR>')
