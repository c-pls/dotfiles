vim.schedule(function ()
  local g = vim.g
  vim.cmd('COQnow -s')
  local lsp = require ("lspconfig")
  local coq = require('coq')
  require("packer").loader("coq_nvim coq.artifacts")
  -- testing for python right now
  --
  local servers = {'pyright', 'tsserver', 'bashls', 'html', 'cssls', 'gopls'} 

  -- for _, server in ipairs(servers) do
  --   lsp[server].setup(coq().lsp_ensure_capabilities())
  -- end 
  lsp.pyright.setup(coq().lsp_ensure_capabilities())
  lsp.gopls.setup(coq().lsp_ensure_capabilities())
  lsp.tsserver.setup(coq().lsp_ensure_capabilities())
  end)

