vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- 之后就可以这样映射按键了
-- map('模式','按键','映射为XX',opt)
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
--visual 模式下可以连续 > 缩进代码


map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制（不常用，因为支持鼠标拖拽）
map("n", "s.", ":vertical resize +20<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>",opt)
map("n", "sk", ":resize -10<CR>",opt)
--Alt+hjkl 窗口跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
--to exit insert mode not used anymore bc better_escape
--map("i", "jk", "<C-c>", opt)

-- nvimTree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)
-- Trouble.vim keymap
-- Lua
map("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
map("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)

-- keymap for vista
map("n", "<leader>v", "<cmd>Vista!!<cr>",
  {silent = true, noremap = true}
  )
-- ----------------------------------
-- bufferline keymap
-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map("n", "<leader><leader>l", "<cmd>BufferLineCycleNext<cr>",
  {silent = true, noremap = true}
  )
map("n", "<leader><leader>h", "<cmd>BufferLineCyclePrev<cr>",
  {silent = true, noremap = true}
  )
-- These commands will move the current buffer backwards or forwards in the bufferline
map("n", "<leader><leader>L", "<cmd>BufferLineMoveNext<cr>",
  {silent = true, noremap = true}
  )
map("n", "<leader><leader>H", "<cmd>BufferLineMovePrev<cr>",
  {silent = true, noremap = true}
  )
-- These commands will sort buffers by directory, language, or a custom criteria
-- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
-- --------------------------------
--  undotree config
map("n", "<leader>fu", "<cmd>UndotreeToggle<cr>",
  {silent = true, noremap = true}
  )
-- --------------------------------
-- telesope keymap
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>",
  {silent = true, noremap = true}
  )
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>",
  {silent = true, noremap = true}
  )
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>",
  {silent = true, noremap = true}
  )
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>",
  {silent = true, noremap = true}
  )
-- Hop config
-- place this in one of your configuration file(s)
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
-- map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- place this in one of your configuration file(s)
map('n', '<leader><leader>w', "<cmd>HopWord<cr>", {})
map('n', '<leader><leader>j', "<cmd>HopLine<cr>", {})
map('n', '<leader><leader>k', "<cmd>HopLine<cr>", {})
map('n', '<leader><leader>s', "<cmd>HopChar2<cr>", {})
-- dap config
map("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", opt)
map("n", "<leader>dn", ":lua require'dap'.continue()<cr>", opt)
map("n", "<leader>do", ":lua require'dap'.step_out()<cr>", opt)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opt)
map("n", "<leader>di", ":lua require'dap'.step_into()<cr>", opt)
map("n", "<leader>dv", ":Telescope dap variables<cr>", opt)
map("n", "<leader>dO", ":lua require'dap'.step_over()<cr>", opt)
-- dapui
map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", opt)
-- --------------------------------
-- session 
map("n", "<leader>ss", ":<C-u>SessionSave<cr>", opt)
map("n", "<leader>sl", ":<C-u>SessionLoad", opt)
-- --------------------------------
--lsp Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- a part of keymap for this is in plugin-config/lsp-installer.lua
-- --------------------------------
--notify history 
map("n", "<leader>nh", ":Telescope notify<cr>", opt)

