return {
    {
        'folke/snacks.nvim',
        priority = 999,
        lazy = false,
        ---@type snacks.Config
        opts = {
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
        config = function(_, opts)
            require('snacks').setup(opts)
            vim.api.nvim_create_user_command('Q', function(opts)
                if #opts.fargs == 1 and opts.fargs[1] == 'all' then
                    Snacks.bufdelete.all({ force = opts.bang })
                elseif #opts.fargs == 1 and opts.fargs[1] == 'other' then
                    Snacks.bufdelete.other({ force = opts.bang })
                else
                    Snacks.bufdelete.delete({ force = opts.bang })
                end
            end, {
                bang = true,
                nargs = '?',
                complete = function(_, cmd, _)
                    if vim.trim(cmd) == 'Q' or vim.trim(cmd) == 'Q!' then
                        return { 'all', 'other' }
                    else
                        return {}
                    end
                end
            })
        end,
    },
}
