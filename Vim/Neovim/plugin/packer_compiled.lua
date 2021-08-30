-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cp/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/cp/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/cp/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/cp/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cp/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/one-nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  sonokai = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight-vim"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/tokyonight-vim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-polyglot"] = {
    commands = { "PolyglotEnable" },
    loaded = false,
    needs_bufread = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/cp/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/cp/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file PolyglotEnable lua require("packer.load")({'vim-polyglot'}, { cmd = "PolyglotEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-prettier'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'vim-prettier'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'vim-prettier'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType less ++once lua require("packer.load")({'vim-prettier'}, { ft = "less" }, _G.packer_plugins)]]
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-prettier'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'vim-prettier'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-prettier'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
