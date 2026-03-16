---@type LazySpec
return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        init = function()
        end,
        config = function(_, opts)
            -- 将git-https转为git-ssh https://github.com/who/what => git@github.com:who/what
            for _, config in pairs(require('nvim-treesitter.parsers')) do
                if config.install_info ~= nil and config.install_info ~= nil then
                    config.install_info.url = config.install_info.url:gsub(
                        "^https://([^:/]+)/",
                        "git@%1:"
                    )
                end
            end
            if not vim.g.vscode then
                vim.api.nvim_create_autocmd("FileType", {
                    callback = function()
                      pcall(vim.treesitter.start)
                      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                      vim.wo[0][0].foldmethod = 'expr'
                      vim.wo[0][0].foldlevel = 1000
                    end,
                })
            end
        end,
    },
    {
        -- 文本对象
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        opts = {
            select = {
                lookahead = true,
            },
        },
        config = function(_, opts)
            require('nvim-treesitter-textobjects').setup(opts)
            vim.keymap.set({'x','o'}, 'af', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
            end)
            vim.keymap.set({'x','o'}, 'if', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
            end)
            vim.keymap.set({'x','o'}, 'ac', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
            end)
            vim.keymap.set({'x','o'}, 'ic', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
            end)
            vim.keymap.set({'x','o'}, 'as', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
            end)
            vim.keymap.set({'x','o'}, 'is', function()
                require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
            end)
        end
    },
    {
        -- 显示代码上下文
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        version = '*',
        cond = not vim.g.vscode,
        opts = {
            enable = true
        }
    },
    {
        -- 自动Tag
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        version = '*',
        cond = not vim.g.vscode,
        event = 'VeryLazy',
        config = true,
    },
    {
        -- % 匹配
        'andymass/vim-matchup',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        cond = not vim.g.vscode,
        event = 'VeryLazy',
    },
    {
        -- 注释
        'JoosepAlviste/nvim-ts-context-commentstring',
        cond = not vim.g.vscode,
    },
    {
        -- 自动括号
        'windwp/nvim-autopairs',
        version = '*',
        cond = not vim.g.vscode,
        event = 'VeryLazy',
        opts = {
            modes = { insert = true, command = true, terminal = false },
            check_ts = true,
            skip_ts = { 'string' },
            skip_unbalanced = true,
        },
    },
}
