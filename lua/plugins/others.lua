---@type LazySpec
return {
    {
        'mfussenegger/nvim-lint', version = '*',
    },
    {
        'stevearc/conform.nvim', version = '*',
    },
    {
        {
            'folke/trouble.nvim',
            cond = false,
            opts = {},
        },
        {
            'rachartier/tiny-inline-diagnostic.nvim',
            priority = 1000,
            opts = {
                preset = 'classic'
            }
        },
    },
    {
        -- git相关
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            local git = require('gitsigns')
            git.setup()
            -- 跳转到上一个更改
            vim.keymap.set('n', ']c', function() git.nav_hunk('next') end)
            -- 跳转到下一个更改
            vim.keymap.set('n', '[c', function() git.nav_hunk('prev') end)
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        event = 'VeryLazy',
        config = true,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                globalstatus = true,
            },
        },
    },
    {
        -- 缩进线
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
        },
    },
    {
        -- 实时显示按键
        {
            'NStefan002/screenkey.nvim',
            lazy = false,
            version = '*',
        },
        {
            'nvzone/showkeys',
            opts = {
                maxkeys = 15,
            },
        },
    },
    {
        'folke/snacks.nvim',
        priority = 999,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bufdelete = {},
            dashboard = {
                preset = {
                    header = [[]],
                },
            },
            input = {},
            picker = {
                win = {
                    input = {
                        keys = {
                            ['<Esc>'] = { 'close', mode = { 'i', 'n' } },
                            ['<C-U>'] = false,
                        },
                    },
                },
            },
        },
    },
    {
        'nvim-mini/mini.nvim',
        config = function()
            local minimap = require('mini.map')
            minimap.setup({
                symbols = {
                    encode = minimap.gen_encode_symbols.dot('4x2'),
                },
                window = {
                    width = 10,
                    winblend = 100,
                    show_integration_count = true,
                }
            })
            vim.keymap.set('n', '<Leader>mm', minimap.toggle)
        end
    },
    {
        -- 光标当前词高亮
        'RRethy/vim-illuminate',
    },
    {
        -- 侧边
        'lewis6991/satellite.nvim',
        -- 鼠标功能 neovide需要添加启动参数 neovide --no-multigrid
        opts = {
            handlers = {
                -- 去掉m标记(与nerdtree的m冲突)
                marks = {
                    enable = false,
                },
            },
        },
    },
    {
        -- 用颜色显示颜色的文本
        'brenoprata10/nvim-highlight-colors',
    },
}
