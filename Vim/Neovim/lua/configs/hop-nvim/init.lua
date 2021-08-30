local map = require('utils').map
require "hop".setup {
    keys = "etovxqpdygfblzhckisuran"
}

-- Mapping
map('n','hl', '<cmd>:HopLine<CR>')
map('n', 'hc', '<cmd>:HopChar1<CR>')
map('n', 'hw', '<cmd>:HopWord<CR>' )
