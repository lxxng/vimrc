local vim = vim
-- 始终显示状态栏(set laststatus=2) 且占满
vim.opt.laststatus = 3
-- <C-Insert>复制 
vim.keymap.set('v', '<C-Insert>', '"+y', { noremap = true })
-- <S-Insert>粘贴
vim.keymap.set({'i','c'}, '<S-Insert>', '<C-R>+', { noremap = true })
-- 重绘
vim.opt.lazyredraw = false
-- []
vim.keymap.del('n', '[d')
vim.keymap.del('n', ']d')
vim.keymap.del('n', '[D')
vim.keymap.del('n', ']D')
vim.keymap.del('n', '[q')
vim.keymap.del('n', ']q')
vim.keymap.del('n', '[Q')
vim.keymap.del('n', ']Q')
vim.keymap.del('n', '[l')
vim.keymap.del('n', ']l')
vim.keymap.del('n', '[L')
vim.keymap.del('n', ']L')
vim.keymap.del('n', '[t')
vim.keymap.del('n', ']t')
vim.keymap.del('n', '[T')
vim.keymap.del('n', ']T')
vim.keymap.del('n', '[a')
vim.keymap.del('n', ']a')
vim.keymap.del('n', '[A')
vim.keymap.del('n', ']A')
vim.keymap.del('n', '[b')
vim.keymap.del('n', ']b')
vim.keymap.del('n', '[B')
vim.keymap.del('n', ']B')
vim.keymap.del('n', '[<Space>')
vim.keymap.del('n', ']<Space>')
-- ReplaceWithRegister
pcall(vim.keymap.del, 'n', 'gri')
pcall(vim.keymap.del, 'n', 'grt')
pcall(vim.keymap.del, 'n', 'grn')
pcall(vim.keymap.del, { 'n', 'x' }, 'gra')
-- 终端
vim.keymap.set('n', '<Leader>t', '<CMD>botright terminal<CR>', { noremap = true })
-- 终端 打开时 自动切换为startinsert
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*', callback = function() vim.cmd.startinsert() end
})
-- 终端 <C-W>时
vim.keymap.set('t', '<C-w>', function()
    -- <C-W>切换窗口
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes('<C-\\><C-n><C-w>', true, false, true),
        'n', true
    )
    -- 取消(停留在终端), 自动改为startinsert()
    vim.schedule(function()
        local win_id = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win_id)
        if vim.bo[buf].buftype == 'terminal' then
            vim.api.nvim_win_call(win_id, function()
                vim.cmd.startinsert()
            end)
        end
    end)
end)
-- 终端 切换窗口时 如果终端为normal 切换为startinsert
vim.api.nvim_create_autocmd('WinEnter', {
    pattern = 'term://*',
    callback = function()
        local win_id = vim.api.nvim_get_current_win()

        -- 自动改为startinsert()
        vim.schedule(function()
            -- winresizer 
            if win_id == vim.api.nvim_get_current_win() then
                local buf = vim.api.nvim_win_get_buf(win_id)
                if vim.bo[buf].buftype == 'terminal' then
                    vim.api.nvim_win_call(win_id, function()
                        vim.cmd.startinsert()
                    end)
                end
            end
        end)
    end
})


vim.keymap.set('n', ']e', function()
    vim.diagnostic.jump({count = 1, _highest = true})
end)
vim.keymap.set('n', '[e', function()
    vim.diagnostic.jump({count = -1, _highest = true})
end)
