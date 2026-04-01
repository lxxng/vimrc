---@type LazySpec
return {
    {
        'nvim-telescope/telescope.nvim',
        cond = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            -- mingw64 make: 将 mingw32-make.exe 复制为 make.exe
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        opts = {
            defaults = {
                path_display = {
                    'truncate',     -- 优先展示文件结尾
                },
                mappings = {
                    i = {
                        ['<Esc>'] = require('telescope.actions').close,
                        ['<C-U>'] = false,
                    },
                },
            },
            pickers = {
                find_files = { hidden = true, },
                live_grep = { hidden = true, },
                grep_string = { hidden = true, },
                oldfiles = { hidden = true, },
                git_files = { hidden = true, }
            },
            extensions = {
                ['ui-select'] = {},
                fzf = { fuzzy = true },
            }
        },
        config = function(_, opts)
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')
            telescope.setup()
            telescope.setup(opts)

            vim.g.telescope_input_ff = ''
            vim.g.telescope_input_fg = ''

            vim.keymap.set('n', '<leader>ff', function()
                vim.ui.input({ prompt = 'keyword:', default = vim.g.telescope_input_ff }, function(input)
                    if input == nil then
                        vim.g.telescope_input_ff = ''
                    else
                        vim.g.telescope_input_ff = input

                        local pattern = {}
                        for i = 1, #input do
                            local c = input:sub(i, i)
                            local lower = c:lower()
                            local upper = c:upper()
                            if lower == upper then
                                table.insert(pattern, c)
                            else
                                table.insert(pattern, "[" .. lower .. upper .. "]")
                            end
                        end
                        builtin.find_files({ search_file = table.concat(pattern), hidden = true })
                    end
                end)
            end)
            vim.keymap.set('x', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', function()
                vim.ui.input({ prompt = 'keyword:', default = vim.g.telescope_input_fg }, function(input)
                    if input == nil then
                        vim.g.telescope_input_fg = ''
                    else
                        vim.g.telescope_input_fg = input
                        builtin.grep_string( { search = input, hidden = true })
                    end
                end)
            end)
            vim.keymap.set('x', '<leader>fg', builtin.grep_string)
            vim.keymap.set('n', '<Leader>fG', builtin.live_grep)
            vim.keymap.set('n', 'gR', builtin.lsp_references)
            vim.keymap.set('n', 'gd', builtin.lsp_definitions)
            vim.keymap.set('n', 'gy', builtin.lsp_type_definitions)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
            vim.keymap.set('n', 'gI', builtin.lsp_implementations)
            vim.keymap.set('n', '<Leader>i', vim.lsp.buf.code_action)

            vim.keymap.set('n', '<Leader>f<Space>', '<Esc>:<C-U>Telescope ')

            vim.schedule(function()
                telescope.load_extension('ui-select')
                telescope.load_extension('fzf')
            end)
        end,
    },
    {
        'ibhagwan/fzf-lua',
        cond = false,
        opts = {
            fzf_bin = vim.g.vimdir .. '/plugged/fzf/bin/fzf',
            winopts = {
                fullscreen = true,
            },
        },
        config = function(_, opts)
            require('fzf-lua').setup(opts)
            local fzf = require('fzf-lua')
            vim.keymap.set('n', 'gR', fzf.lsp_references)
            vim.keymap.set('n', 'gd', fzf.lsp_definitions)
            vim.keymap.set('n', 'gy', fzf.lsp_typedefs)
            vim.keymap.set('n', 'gD', fzf.lsp_declarations)
            vim.keymap.set('n', 'gI', fzf.lsp_implementations)
            fzf.register_ui_select()
            vim.keymap.set('n', '<Leader>i', fzf.lsp_code_actions)
            vim.keymap.set({'n', 'v'}, '<Leader>ff', fzf.files)
            vim.keymap.set('n', '<Leader>fF', fzf.git_files)
            vim.keymap.set('n', '<Leader>fg', fzf.live_grep)
            vim.keymap.set('n', '<Leader>fG', function()
                fzf.live_grep { search_paths = fzf.path.git_root {} }
            end)
            vim.keymap.set('n', '<Leader>f<Space>', '<Esc>:<C-U>FzfLua ')
        end,

    }
}
