vim.g.mapleader = ','

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.eol = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.shell = '/opt/homebrew/bin/zsh'

local map = vim.keymap.set

map('n', '<leader>bn', vim.cmd.bnext)
map('n', '<leader>bp', vim.cmd.bprev)
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
