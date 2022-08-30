
local Rule = require('nvim-autopairs.rule')

local cond = require('nvim-autopairs.conds')
local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    enable_check_bracket_line = false
})

local ts_conds = require('nvim-autopairs.ts-conds')

