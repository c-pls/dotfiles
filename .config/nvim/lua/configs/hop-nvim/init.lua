local map = require('utils').map
require "hop".setup {
    keys = "etovxqpdygfblzhckisuran"
}

-- Mapping
map('n','nl', '<cmd>:HopLine<CR>')
map('n', 'nc', '<cmd>:HopChar1<CR>')
map('n', 'nw', '<cmd>:HopWord<CR>' )
