vim.g.mapleader = " "

vim.wo.number = true
local opts = { noremap = true }

vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>q', ':q!<CR>')
vim.keymap.set('n', '<C-s>', ':w!<CR>')
vim.keymap.set('n', '<C-q>', ':wqa<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>', opts)

-- move marked lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', 'J', "mzJ`z")

-- center cursor on moving around
vim.keymap.set('v', '<C-d>', "<C-d>zz")
vim.keymap.set('v', '<C-u>', "<C-u>zz")

-- center cursor on search 
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

vim.keymap.set('x', '<leader>p', "\"_dp")

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
