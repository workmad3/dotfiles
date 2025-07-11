vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.eol = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.shell = '/opt/homebrew/bin/zsh'

HOME = os.getenv("HOME")

vim.opt.undodir = HOME .. '/.local/state/nvim/undo//'
vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.undoreload = 10000

vim.opt.backupdir = HOME .. '/.local/state/nvim/backup//'
vim.opt.backup = true

vim.opt.directory = HOME .. '/.local/state/nvim/swap//'
vim.opt.swapfile = false

vim.opt.modelines = 0

vim.opt.dictionary = '/usr/share/dict/words'

vim.api.nvim_create_autocmd(
	{ "BufWritePre" },
	{
		pattern = '*',
		command = [[:%s/\s\+$//e]]
	}
)
