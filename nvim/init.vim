let g:everforest_background = 'hard'
colorscheme 2077
set guifont=:Hack\ Nerd\ font:h7.5
set hidden                  " to use terminal plugin: toggleterm.nvim
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set mouse=v                 " middle-click paste with 
set incsearch               " incremental search
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard+=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set undofile
set undodir=~/.nvim/undo
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" accelerate up-down by accelerate-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" ----------------------------------
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l
noremap t o<Esc>k
noremap T O<Esc>j
nnoremap <silent> Q :RnvimrToggle<CR>
tnoremap <silent> Q <C-\><C-n>:RnvimrToggle<CR>
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>
" ----------------------------------
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
" ----------------------------------
" bufferline keymap
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>]p :BufferLineCycleNext<CR>
nnoremap <silent>[p :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent>{p :BufferLineMoveNext<CR>
nnoremap <silent>}p :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
" nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" ----------------------------------
" smart edit by suda.vim
let g:suda_smart_edit = 1
" ----------------------------------
"packer.vim
lua require('plugins')
" lua config
lua require('basic')
lua require('keybindings')
lua require('plugin-config/bufferline')
lua require('plugin-config/nvim-tree')
lua require('plugin-config/lualine')
lua require('plugin-config/nvim-treesitter')
lua require'colorizer'.setup()
lua require('plugin-config/nvim-ts-rainbow')
lua require('plugin-config/nvim-gps')
lua require('plugin-config/specs')
lua require('plugin-config/telescope')
lua require('plugin-config/autopairs')
lua require('plugin-config/indent-blankline')
lua require('scrollbar').setup()
lua require('plugin-config/nvim-web-devicons')
" lua require('plugin-config/dapui')
" lua require('plugin-config/dap-virtual-text')
lua require('plugin-config/colorizer')
lua require('plugin-config/lsp-installer')
lua require('plugin-config/nvim-lightbulb')
lua require('plugin-config/cmp')
lua require('plugin-config/autosession')

" ----------------------------------
" lua require('dap-debugger-config/python')
" ----------------------------------
" neovide config
let g:neovide_refresh_rate=140
let g:neovide_no_idle=v:true
let g:neovide_remember_window_size = v:true
let g:neovide_input_use_logo=v:true
let g:neovide_touch_deadzone=6.0
let g:neovide_touch_drag_timeout=0.3
let g:neovide_cursor_animation_length=0.13
let g:neovide_cursor_trail_length=0.3
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "pixiedust"
" ----------------------------------
" config sandwich
"let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" ----------------------------------
" config better-escape.vim
" set time interval to 200 ms
let g:better_escape_interval = 200
" non-ASCII shortcuts are also supported for non-English keyboard.
let g:better_escape_shortcut = ['jk', 'jj', 'kj']
" ----------------------------------
" telesope keymap
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" ----------------------------------
" wilder.vim config
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))
" ----------------------------------
" dashboard-nvim config
" Default value is clap
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fH :DashboardFindHistory<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fB :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" Disable the plugin while in dashboard
let g:indentLine_fileTypeExclude = ['dashboard']
" disable the tabline in dashboard buffer
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
" minimap config
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
" ----------------------------------
"  undotree config
nnoremap <silent> <Leader>fu :UndotreeToggle<CR>
" ----------------------------------
" vista config
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
" let g:vista_executive_for = {
"   \ 'cpp': 'vim_lsp',
"   \ 'php': 'vim_lsp',
"   \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" Do not echo message on command line
let g:vista_echo_cursor = 0
" keymap for vista
nnoremap <silent> <leader>v :Vista!!<CR>
" ----------------------------------
" ----------------------------------
