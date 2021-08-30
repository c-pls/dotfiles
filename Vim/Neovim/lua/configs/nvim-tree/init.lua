local utils = require('../../utils')

local g = vim.g

vim.o.termguicolors = true -- this variable must be enabled for colors to be applied properly

g.nvim_tree_side = 'left' --left by default
g.nvim_tree_width = 25 --"30 by default, can be width_in_columns or 'width_in_percent%'
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } --"empty by default
g.nvim_tree_gitignore = 1 --"0 by default
g.nvim_tree_auto_open = 0 --"0 by default, opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_close = 1 --"0 by default, closes the tree when it's the last window
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } --"empty by default, don't auto open tree on specific fip.s.
g.nvim_tree_quit_on_open = 0 --"0 by default, closes the tree when you open a file
g.nvim_tree_follow = 0 --"0 by default, this option allows the cursor to be updated when entering a buffer
g.nvim_tree_indent_markers = 0 --"0 by default, this option shows indent markers when folders are open
g.nvim_tree_hide_dotfiles = 0 --"0 by default, this option hides files and folders starting with a dot `.`
g.nvim_tree_git_hl = 1 --"0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 --"0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = ':~' --"This is the default. See :help filename-modifiers for more options
g.nvim_tree_tab_open = 1 --"0 by default, will open the tree when entering a new tab and the tree was previously open
g.nvim_tree_auto_resize = 1--"1 by default, will resize the tree to its saved width when opening a file
g.nvim_tree_disable_netrw = 1 --"1 by default, disables netrw
g.nvim_tree_hijack_netrw = 1--"1 by default, prevents netrw from automatically opening when opening directories (but  .ou keep its other utilities)
g.nvim_tree_add_trailing = 0 --"0 by default, append a trailing slash to folder names
g.nvim_tree_group_empty = 0 --" 0 by default, compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_lsp_diagnostics = 0 --"0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
g.nvim_tree_disable_window_picker = 0 --"0 by default, will disable the window picker.
g.nvim_tree_hijack_cursor = 1 --"1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
g.nvim_tree_icon_padding = ' ' --"one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
g.nvim_tree_symlink_arrow = ' >> ' --" defaults to ' ➛ '. used as a separator between symlinks' source and target.
g.nvim_tree_update_cwd = 0 --"0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
g.nvim_tree_respect_buf_cwd = 0 --"0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0
}

g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
    },
    folder = {
        default = "",
        open = "",
        symlink = ""
    },
    lsp = {
         hint = "",
         info = "",
         warning = "",
         error = "",
       }
}


-- Mapping
utils.map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
utils.map("n", "<C-f>", ":NvimTreeFindFile<CR>", { silent = true })
--utils.map("n", "<leader>R", ":NvimTreeRefresh<CR>", { silent = true })

-- Set KeyBindings

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      { key = "<C-v>",                        cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "<C-m>",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "<S-CR>",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "s",                            cb = tree_cb("system_open") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
    }








