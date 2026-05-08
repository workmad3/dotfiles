return {
  {
    "lukas-reineke/lsp-format.nvim",
    event = "LspAttach",
    config = function()
      require("config.formatter")
    end
  },
}
