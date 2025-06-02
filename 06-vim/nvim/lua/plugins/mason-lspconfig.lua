return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "ruby_lsp", "rubocop", "lua_ls", "cssls", "html", "jsonls", "terraformls", "ts_ls", "yamlls" },
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			{
				"neovim/nvim-lspconfig",
				config = function()
					require('config.lspconfig')
				end
			},
		},
	},
}
