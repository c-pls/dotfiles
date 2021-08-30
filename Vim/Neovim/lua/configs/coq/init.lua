vim.schedule(function ()
  local g = vim.g
  vim.cmd('COQnow')
  local lsp = require ("lspconfig")
  local coq = require('coq')
  require("packer").loader("coq_nvim coq.artifacts")
  -- testing for python right now
  lsp.pyright.setup(coq().lsp_ensure_capabilities())
  lsp.gopls.setup(coq().lsp_ensure_capabilities())
  end)
