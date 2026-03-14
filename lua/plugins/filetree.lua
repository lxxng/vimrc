return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false,                      -- neo-tree will lazily load itself
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "mikew/nvim-drawer",
            "antosha417/nvim-lsp-file-operations"
        }, -- 可选，不需要图标可直接删除
        init = function()
            vim.g.loaded_netrw       = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = {
            actions = {

            },
            renderer = {
                group_empty = true,
            },
            diagnostics = {
                enable = true,
            },
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
            },
        }
    },
}

