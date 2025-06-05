return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"ruby", "yaml", "terraform", "css", "html", "dockerfile", "gitignore", "gitcommit", "editorconfig", "json", "javascript", "scss", "lua"
			}
		}
	}
}
