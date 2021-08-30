local map =
    require(
    "utils"
).map
local g =
    vim.g

-- Map leader to space
g.mapleader =
    " "
g.maplocalleader =
    ","
-- Mapping
-- Esc
map(
    "i",
    "jj",
    "<Esc>"
) --jj to Esc

map(
    "n",
    "<C-l>",
    "<cmd>noh<CR>"
) -- clear hightlight
map(
    "n",
    "<C-s>",
    "<cmd>:w!<CR>"
) -- save on normal mode
