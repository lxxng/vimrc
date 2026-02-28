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
        opts = {
            default_mappings = false,
        },
        config = function(_, opts)
            local cursors = require('vscode-multi-cursor')
            cursors.setup(opts)
            vim.keymap.set({ 'n', 'x' }, 'mc', cursors.create_cursor, { expr = true, desc = 'Create cursor' })
            vim.keymap.set({ 'n' }, 'mcc', cursors.cancel, { desc = 'Cancel/Clear all cursors' })
            vim.keymap.set({ 'n', 'x' }, 'mi', cursors.start_left, { desc = 'Start cursors on the left' })
            vim.keymap.set({ 'n', 'x' }, 'mI', cursors.start_left_edge, { desc = 'Start cursors on the left edge' })
            vim.keymap.set({ 'n', 'x' }, 'ma', cursors.start_right, { desc = 'Start cursors on the right' })
            vim.keymap.set({ 'n', 'x' }, 'mA', cursors.start_right, { desc = 'Start cursors on the right' })
            vim.keymap.set({ 'n' }, '[mc', cursors.prev_cursor, { desc = 'Goto prev cursor' })
            vim.keymap.set({ 'n' }, ']mc', cursors.next_cursor, { desc = 'Goto next cursor' })
        end,
    },
}
