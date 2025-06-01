vim.g.mapleader = ','

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.eol = true
		
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.shell = '/opt/homebrew/bin/zsh'

vim.keymap.set('n', '<leader>bn', vim.cmd.bnext)
vim.keymap.set('n', '<leader>bp', vim.cmd.bprev)
