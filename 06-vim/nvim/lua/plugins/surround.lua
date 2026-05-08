return {
	{
		"echasnovski/mini.surround",
		keys = {
			{ "sa", mode = { "n", "v" }, desc = "Add surrounding" },
			{ "sd", desc = "Delete surrounding" },
			{ "sr", desc = "Replace surrounding" },
			{ "sf", desc = "Find surrounding (right)" },
			{ "sF", desc = "Find surrounding (left)" },
			{ "sh", desc = "Highlight surrounding" },
			{ "sn", desc = "Update n surrounding lines" },
		},
		opts = {
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",
			},
		},
	},
}
