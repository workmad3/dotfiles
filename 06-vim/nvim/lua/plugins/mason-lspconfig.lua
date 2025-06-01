return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "ruby-lsp", "rubocop", "lua_ls", "cssls", "html" },
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
			"neovim/nvim-lspconfig",
		},
	},
}
