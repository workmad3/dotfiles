local lspconfig = require('lspconfig')
local m = require("mason-lspconfig")

m.setup({
	ensure_installed = { "ruby_lsp", "rubocop", "lua_ls", "cssls", "html", "jsonls", "terraformls", "ts_ls", "yamlls" },
	automatic_enable = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server_name in pairs(m.get_installed_servers()) do
  local s = {
    capabilities = capabilities
  }

  if server_name == 'lua_ls' then
    s['settings'] = { Lua = { diagnostics = { globals = { 'vim' } } } }
  end
  lspconfig[server_name].setup(s)
  vim.lsp.enable(server_name)
end

local map = vim.keymap.set

map('n', 'gD', vim.lsp.buf.declaration, { silent = true })
map('n', 'gd', vim.lsp.buf.definition, { silent = true })
map('n', 'gi', vim.lsp.buf.implementation, { silent = true })
map('n', 'gr', vim.lsp.buf.references, { silent = true })
map('n', 'go', vim.lsp.buf.type_definition)
map('n', 'gs', vim.lsp.buf.signature_help, { silent = true })
map('n', 'K', vim.lsp.buf.hover, { silent = true })
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { silent = true })
map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { silent = true })
map('n', '<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)

map('n', 'gl', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
