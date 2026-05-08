local m = require("mason-lspconfig")

m.setup({
  ensure_installed = { "ruby_lsp", "rubocop", "lua_ls", "cssls", "html", "jsonls", "terraformls", "ts_ls", "yamlls" },
  automatic_enable = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server_name in pairs(m.get_installed_servers()) do
  local s = {
    capabilities = capabilities
  }

  if server_name == 'lua_ls' then
    s['settings'] = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        format = {
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
      },
    }
  elseif server_name == 'yamlls' then
    s['settings'] = {
      yaml = {
        format = {
          -- Keep YAML formatting but effectively disable line-length wrapping.
          printWidth = 1000,
        },
      },
    }
  end
  vim.lsp.config(server_name, s)
  vim.lsp.enable(server_name)
end

-- Auto-restart LSP servers that crash, with a cooldown to avoid restart loops
local restart_cooldowns = {}

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Check if the client actually exited (not a manual detach/stop)
    -- Defer so the client has time to fully shut down
    vim.defer_fn(function()
      -- If client is still accessible it was a normal detach, not a crash
      if vim.lsp.get_client_by_id(args.data.client_id) then return end

      local name = client.name
      local now = vim.uv.now()
      local last = restart_cooldowns[name] or 0

      -- 5 second cooldown to avoid restart loops
      if now - last < 5000 then return end
      restart_cooldowns[name] = now

      -- Only restart if there are still buffers that match this server
      local bufs = vim.fn.getbufinfo({ buflisted = true })
      for _, buf in ipairs(bufs) do
        if buf.loaded == 1 then
          vim.notify(
            "LSP server '" .. name .. "' exited unexpectedly. Restarting...",
            vim.log.levels.WARN
          )
          -- LspStart with the server name restarts it
          vim.cmd("LspStart " .. name)
          return
        end
      end
    end, 500)
  end,
})
