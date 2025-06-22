return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
		cmd = "Telescope"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = {},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
