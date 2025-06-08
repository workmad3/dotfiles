return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		}
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatClose", "CopilotChatToggle", "CopilotChatStop", "CopilotChatReset", "CopilotChatSave", "CopilotChatLoad", "CopilotChatPrompts", "CopilotChatModels", "CopilotChatAgents" },
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "claude-sonnet-4",
		},
	},
}
