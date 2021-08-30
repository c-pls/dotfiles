local map = require('utils').map
local g = vim.g

-- Map leader to space
g.mapleader = ' '
g.maplocalleader = ','

-- Mapping

map('i', 'jj', '<Esc>' ) --jj to Esc
map('i', '<CapsLock>', '<Esc>')

map('n', '<C-l>', '<cmd>noh<CR>')
map('n', '<C-s>', '<cmd>:w!<CR>')
