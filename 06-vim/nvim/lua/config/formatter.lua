vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      require("lsp-format").on_attach(client, args.buf)
    end
  end,
})
