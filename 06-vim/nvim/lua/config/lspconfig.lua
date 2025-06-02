local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
	settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
})

local map = vim.keymap.set

map('n', 'gD', vim.lsp.buf.declaration, { silent = true })
map('n', 'gd', vim.lsp.buf.definition, { silent = true })
map('n', 'gi', vim.lsp.buf.implementation, { silent = true })
map('n', 'gr', vim.lsp.buf.references, { silent = true })
map('n', '<leader>K', vim.lsp.buf.hover, { silent = true })
map('n', '<leader>k', vim.lsp.buf.signature_help, { silent = true })
map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { silent = true })
map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { silent = true })
map('n', '<leader>D', vim.lsp.buf.type_definition)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
