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
