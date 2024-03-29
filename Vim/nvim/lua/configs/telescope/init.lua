local map = require('utils').map

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local function map_telescope(keys, builtin_function)
  map('n', '<leader>'..keys, ":lua require('telescope.builtin')."..builtin_function.."()<cr>")
end

-- map('n', '<leader>ff','<cmd>:lua require('telescope.builtin').find_files()<CR>')
-- map('n', '<leader>fg','<cmd>:lua require('telescope.builtin').live_grep()<CR>')
-- map('n', '<leader>fb','<cmd>:lua require('telescope.builtin').buffers()<CR>')
-- map('n', '<leader>fh','<cmd>:lua require('telescope.builtin').help_tags()<CR>')

map_telescope('b', 'buffers')
map_telescope('ff', 'find_files')
map_telescope('fg', 'live_grep')
map_telescope('fc', 'commands')

map_telescope('fh', 'help_tags')
map_telescope('fb', 'file_browser')
map_telescope('fq', 'quickfix')
map_telescope('fvo', 'vim_options')
map_telescope('fts', 'treesitter')
map_telescope('fkm', 'keymaps')
map_telescope('fcs', 'colorscheme')


map_telescope('lt', 'builtin')







