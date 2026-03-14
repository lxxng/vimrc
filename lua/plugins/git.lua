return {
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
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "esmuellert/codediff.nvim",      -- optional
            "nvim-telescope/telescope.nvim", -- optional
        },
    },
    -- todo: lazygit?
}

