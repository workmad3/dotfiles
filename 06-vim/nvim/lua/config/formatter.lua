vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		require("lsp-format").on_attach(client, args.buf)
	end,
})
