local nvim_lsp = require('lspconfig')
-- local saga = require'lspsaga'
local lsp_signature = require("lsp_signature")
local lsp_status = require("lsp-status")
local format = require('lsp.format')
local map = require('utils').map

local coq = require "coq"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

-- require'lspinstall'.setup()

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

local enhance_attach = function(client,bufnr)
  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

nvim_lsp.gopls.setup {
  cmd = {"gopls","--remote=auto"},
  on_attach = enhance_attach,
  capabilities = capabilities,
  init_options = {
    usePlaceholders=true,
    completeUnimported=true,
  }
}

function go_organize_imports_sync(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, 't', true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result then return end
  result = result[1].result
  if not result then return end
  edit = result[1].edit
  vim.lsp.util.apply_workspace_edit(edit)
end
vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")


local servers = { 'pyright', 'tsserver', 'bashls', 'clangd', 'html','cssls'}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    coq.lsp_ensure_capabilities,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lsp_status.config {
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ["start"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[1])
        },
        ["end"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[2])
        }
      }

      return require("lsp-status.util").in_range(cursor_pos, value_range)
    end
  end,
  diagnostic = false,
}
lsp_status.register_progress()


local lsp_signature_config = {
  bind = true,
  doc_lines = 0,
  floating_window = true,
  hint_enable = true,
  handler_opts = {
    border = "single"
  }
}

-- nvim_lsp.graphql.setup{
--     cmd = { "graphql-lsp", "server", "-m", "stream" },
--     filetypes = { "graphql", "typescriptreact", "javascriptreact" },
--     root_dir = root_pattern('.git', '.graphqlrc*', '.graphql.config.*'),
-- }

-- nvim_lsp.tsserver.setup {
--     on_attach = function(client, bufnr)
--         local ts_utils = require("nvim-lsp-ts-utils")

--         -- defaults
--         ts_utils.setup {
--             debug = false,
--             disable_commands = false,
--             enable_import_on_completion = true,
--             import_on_completion_timeout = 5000,

--             -- eslint
--             eslint_enable_code_actions = true,
--             eslint_bin = "eslint",
--             eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
--             eslint_enable_disable_comments = true,

-- 	    -- experimental settings!
--             -- eslint diagnostics
--             eslint_enable_diagnostics = true,
--             eslint_diagnostics_debounce = 250,

--             -- formatting
--             enable_formatting = true,
--             formatter = "prettier",
--             formatter_args = {"--stdin-filepath", "$FILENAME"},
--             format_on_save = true,
--             no_save_after_format = false,

--             -- parentheses completion
--             complete_parens = false,
--             signature_help_in_parens = true,

-- 	    -- update imports on file move
-- 	    update_imports_on_move = false,
-- 	    require_confirmation_on_move = false,
-- 	    watch_dir = "/src",
--         }

--         -- required to enable ESLint code actions and formatting
--         ts_utils.setup_client(client)

--         -- no default maps, so you may want to define some here
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
--     end
-- }

-- saga.init_lsp_saga {
--     use_saga_diagnostic_sign = false,
--     finder_action_keys = {
--       open = 'o',
--       vsplit = 's',
--       split = 'i',
--       quit = {'q','<esc>'},
--       scroll_down = '<C-f>',
--       scroll_up = '<C-b>' -- quit can be a table
--     },
--     code_action_keys = {
--       quit = {'q','<esc>'},
--       exec = '<CR>',
--     },
--     rename_action_keys = {
--       quit = {'<C-c>', '<esc>'},
--       exec = '<CR>',
--     },
--       code_action_icon = '💡'
--   }

-- nvim_lsp.diagnosticls.setup {
--   filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
--   init_options = {
--     filetypes = {
--       javascript = "eslint",
--       typescript = "eslint",
--       javascriptreact = "eslint",
--       typescriptreact = "eslint"
--     },
--     linters = {
--       eslint = {
--         sourceName = "eslint",
--         command = "./node_modules/.bin/eslint",
--         rootPatterns = {
--           ".eslitrc.js",
--           "package.json"
--         },
--         debounce = 100,
--         args = {
--           "--cache",
--           "--stdin",
--           "--stdin-filename",
--           "%filepath",
--           "--format",
--           "json"
--         },
--         parseJson = {
--           errorsRoot = "[0].messages",
--           line = "line",
--           column = "column",
--           endLine = "endLine",
--           endColumn = "endColumn",
--           message = "${message} [${ruleId}]",
--           security = "severity"
--         },
--         securities = {
--           [2] = "error",
--           [1] = "warning"
--         }
--       }
--     }
--   }
-- }

-- map("n", "gh",":Lspsaga lsp_finder<CR>")

-- vim.cmd[[
-- nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
-- vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

-- nnoremap <silent><leader>ca :Lspsaga code_action<CR>
-- vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

-- "show hover doc
-- nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
-- " or use command
-- nnoremap <silent>K :Lspsaga hover_doc<CR>

-- " scroll down hover doc or scroll in definition preview
-- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- "" scroll up hover doc
-- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

-- nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
--   nnoremap <silent> gs :Lspsaga signature_help<CR>

--   nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
--   nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

--   nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
-- tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

-- ]]

