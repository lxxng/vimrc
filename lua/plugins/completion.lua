---@type LazySpec
return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset      = 'none',
                ['<Esc>']   = { 'snippet_forward', 'fallback' },
                ['<CR>']    = { 'accept', 'fallback' },
                ['<Tab>']   = { function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end, 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<C-E>']   = { 'hide', 'fallback' },
                ['<Down>']  = { 'select_next', 'fallback' },
                ['<Up>']    = { 'select_prev', 'fallback' },
                ['<C-N>']   = { 'select_next', 'fallback' },
                ['<C-P>']   = { 'select_prev', 'fallback' },
                ['<C-B>']   = { 'scroll_documentation_up', 'fallback' },
                ['<C-F>']   = { 'scroll_documentation_down', 'fallback' },
            },
            completion = {
                list = {
                    selection = {
                        preselect = function(ctx)
                            return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active { direction = 1 }
                        end,
                        auto_insert = function(ctx) return ctx.mode == 'cmdline' end,
                    },
                },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                },
            },
            cmdline = {
                keymap = {
                    preset      = 'none',
                    ['<Tab>']   = { 'show_and_insert', 'show_and_insert_or_accept_single', 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'show_and_insert', 'show_and_insert_or_accept_single', 'select_prev', 'fallback' },
                    ['<C-E>']   = { 'cancel', 'fallback' },
                    ['<Down>']  = { 'select_next', 'fallback' },
                    ['<Up>']    = { 'select_prev', 'fallback' },
                    ['<C-N>']   = { 'select_next', 'fallback' },
                    ['<C-P>']   = { 'select_prev', 'fallback' },
                    -- 空格删除的同时隐藏
                    ['<BS>']    = { function(cmp)
                        cmp.hide()
                        return false
                    end, 'fallback' },
                    ['<Space>'] = { function(cmp)
                        cmp.hide()
                        return false
                    end, 'fallback' },
                    ['<C-H>']   = { function(cmp)
                        cmp.hide()
                        return false
                    end, 'fallback' },
                    ['<C-W>']   = { function(cmp)
                        cmp.hide()
                        return false
                    end, 'fallback' },
                    ['<C-U>']   = { function(cmp)
                        cmp.hide()
                        return false
                    end, 'fallback' },
                },
                completion = {
                    ghost_text = {
                        enabled = true,
                    },
                },
            },
        },
        opts_extend = { 'sources.default' },
    },
}
