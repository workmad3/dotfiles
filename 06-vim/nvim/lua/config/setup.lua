vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.eol = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.clipboard = "unnamedplus"

local HOME = os.getenv("HOME")

vim.opt.undodir = HOME .. '/.local/state/nvim/undo//'
vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.undoreload = 10000

vim.opt.backupdir = HOME .. '/.local/state/nvim/backup//'
vim.opt.backup = true

vim.opt.swapfile = false

vim.opt.modelines = 0

vim.opt.dictionary = '/usr/share/dict/words'

-- Strip trailing whitespace on save, but only when no LSP formatter is attached
vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  {
    pattern = '*',
    callback = function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      local has_formatter = false
      for _, client in ipairs(clients) do
        if client.supports_method("textDocument/formatting") then
          has_formatter = true
          break
        end
      end
      if not has_formatter then
        local pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, pos)
      end
    end,
  }
)

-- Auto reload files when changed externally
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  callback = function()
    vim.cmd("silent! checktime")
  end,
})

-- Ensure Lua buffers always use 2-space soft tabs.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
