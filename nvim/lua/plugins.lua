vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- to automatically run :PackerCompile whenever plugins.lua is updated

_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

local has = function(x)
    return vim.fn.has(x) == 1
end

local executable = function(x)
    return vim.fn.executable(x) == 1
end

local is_wsl = (function()
    local output = vim.fn.systemlist "uname -r"
    return not not string.find(output[1] or "", "WSL")
end)()

-- require('packer.luarocks').cfg({ luarocks =

return require("packer").startup {
    function(use)
        local local_use = function(first, second, opts)
            opts = opts or {}

            local plug_path, home
            if second == nil then
                plug_path = first
                home = "tjdevries"
            else
                plug_path = second
                home = first
            end

            if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
                opts[1] = "~/plugins/" .. plug_path
            else
                opts[1] = string.format("%s/%s", home, plug_path)
            end

            use(opts)
        end

        local py_use = function(opts)
            if not has "python3" then
                return
            end

            use(opts)
        end
        --Beginning of config
        use "EdenEast/nightfox.nvim" -- Packer
        use 'akai54/2077.nvim'
        use "wbthomason/packer.nvim"
        use "lewis6991/impatient.nvim"
        -- use "camspiers/snap"
        use 'kyazdani42/nvim-web-devicons'
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use 'sainnhe/everforest'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icon
            },
        }
        -- notify
        use 'rcarriga/nvim-notify'
        -- ipynb
        use 'bfredl/nvim-ipy'
        use 'GCBallesteros/jupytext.vim'
        use 'kana/vim-textobj-user'
        use 'GCBallesteros/vim-textobj-hydrogen'
        -- bufferline
        use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
        -- treesitter 高亮插件
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'norcalli/nvim-colorizer.lua' }
        use { 'tpope/vim-surround' }
        use { 'kevinhwang91/rnvimr' }
        use { 'lambdalisue/suda.vim' } -- Lua
        use {
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter"
        }
        use { 'rhysd/accelerated-jk' }
        use { 'jdhao/better-escape.vim', event = 'InsertEnter' }
        use { 'edluffy/specs.nvim' }
        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        -- Lua
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        -- Lua
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        use { 'gelguy/wilder.nvim' }
        use { 'windwp/nvim-autopairs' }
        use { "nathom/filetype.nvim" } -- speed up nvim load
        use { 'glepnir/dashboard-nvim' }
        use { 'lukas-reineke/indent-blankline.nvim' }
        use { "petertriho/nvim-scrollbar" }
        -- use { 'wfxr/minimap.vim' }
        use { 'tpope/vim-commentary' }
        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        }
        require 'hop'.setup()
        use { 'mbbill/undotree' }
        use { 'liuchengxu/vista.vim' }
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        require('telescope').load_extension('projects')

        use "Pocco81/DAPInstall.nvim" --
        use 'mfussenegger/nvim-dap'
        use 'nvim-telescope/telescope-dap.nvim'
        require('telescope').load_extension('dap')
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } } --
        use 'theHamsta/nvim-dap-virtual-text'
        use 'jbyuki/one-small-step-for-vimkind' -- lua dap
        use 'nacro90/numb.nvim'
        use 'andymass/vim-matchup'
        require('numb').setup()
        use 'godlygeek/tabular'
        -- LSP
        use "neovim/nvim-lspconfig" -- enable LSP
        use "williamboman/nvim-lsp-installer" -- simple to use language server installer
        -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
        -- use "RishabhRD/popfix"
        -- use "RishabhRD/nvim-lsputils"
        use "kosayoda/nvim-lightbulb" -- code action
        use "ray-x/lsp_signature.nvim" -- show function signature when typing
        use 'ethanholz/nvim-lastplace'
        -- cmp plugins
        use "hrsh7th/cmp-buffer" -- buffer completions
        use "hrsh7th/cmp-path" -- path completions
        use "hrsh7th/cmp-cmdline" -- cmdline completions
        -- nvim-cmp+snippet
        use { 'L3MON4D3/LuaSnip' }
        use {
            'hrsh7th/nvim-cmp',
            config = function()
                require 'cmp'.setup {
                    snippet = {
                        expand = function(args)
                            require 'luasnip'.lsp_expand(args.body)
                        end
                    },

                    sources = {
                        { name = 'luasnip' },
                        -- more sources
                    },
                }
            end
        }
        use { 'saadparwaiz1/cmp_luasnip' }
        -- snippets
        use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
        -- ---------------------------
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lua"
        -- use "quangnguyen30192/cmp-nvim-tags"
        use "jsfaint/gen_tags.vim"
        use "ray-x/cmp-treesitter"
        use "f3fora/cmp-spell" -- spell check
        -- use "github/copilot.vim"  -- Copilot setup,
        -- use {
        --   "tzachar/cmp-tabnine", -- use ":CmpTabnineHub" command to login
        --   after = "nvim-cmp",
        --   run = 'bash ./install.sh',
        -- }
        -- autosession
        use {
            'rmagatti/auto-session',
            config = function()
                require('auto-session').setup {
                    log_level = 'info',
                    auto_session_suppress_dirs = { '~/', '~/Projects' }
                }
            end
        }
        --EOF
    end,
    config = {
        luarocks = {
            python_cmd = "python3",
        },
        display = {
            -- open_fn = require('packer.util').float,
        },
    },
}
