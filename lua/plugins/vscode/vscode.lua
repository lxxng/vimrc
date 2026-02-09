return {
    {
        import = 'plugins/treesitter',
    },
    {
        'gbprod/yanky.nvim',
        opts = {
        },
    },
    {
        'szb000801/smart-input-pro.nvim',
        config = function(_, opts)
            require('smart-input-pro').setup()
        end,
    },
    {
        'vscode-neovim/vscode-multi-cursor.nvim',
        event = 'VeryLazy',
        config = true,
    },
}
