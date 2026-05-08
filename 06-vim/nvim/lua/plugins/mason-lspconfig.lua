return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require('config.lspconfig')
		end,
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
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},
}
