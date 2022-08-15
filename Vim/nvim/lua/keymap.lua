local map = require("utils").map
local g = vim.g

-- Map leader to space
g.mapleader = " "
g.maplocalleader = ","
-- Mapping
-- Esc
map("i", "jj", "<Esc>") --jj to Esc

-- Ctrl A to go to the beginning of line
map("i", "<C-a>", "<Esc>^")
map("n", "<C-a>", "<Esc>^")

map("n", "<C-l>", "<cmd>noh<CR>") -- clear hightlight
map("n", "<C-s>", "<cmd>:w!<CR>") -- save on normal mode

map("n", "<F6>", ":Prettier<CR>")
-- Use Ctrl hjkl to move around the panel
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

map("v", "<C-s>c", "w !xclip -selection clipboard<CR>")

map("n", "<C-w>", "<C-w>c") -- Ctrl W to close tab

vim.cmd([[
autocmd FileType go map <buffer> <F10> :w<CR>:exec '!go run' shellescape(@%, 1)<CR>
autocmd FileType go imap <buffer> <F10> <esc>:w<CR>:exec '!go run' shellescape(@%, 1)<CR>
let g:user_emmet_leader_key='<C-Z>'

"Running python code directly
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
]])
