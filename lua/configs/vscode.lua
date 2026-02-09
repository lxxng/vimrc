local vim = vim
local action = function(...)
    local args = {...}
    return function()
        ---@diagnostic disable-next-line: deprecated
        require('vscode').action(unpack(args))
    end
end

vim.keymap.set({'n','x'}, '<Leader><Leader>',  action('workbench.action.showCommands'))

vim.keymap.set('n', '<Leader>ef', action('workbench.files.action.showActiveFileInExplorer'))

vim.keymap.set('n', '<Leader>ff', action('workbench.action.quickOpen') )
vim.keymap.set('n', '<Leader>fg', action('workbench.action.quickTextSearch') )

vim.keymap.set('n', '<F1>', action('editor.action.marker.nextInFiles') )
vim.keymap.set('n', '<S-F1>', action('editor.action.marker.prevInFiles') )

vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
vim.keymap.set({'n','x'}, '<Leader>l', vim.lsp.buf.format)
vim.keymap.set('n', 'gR', action('editor.action.goToReferences'))
vim.keymap.set('n', 'gd', action('editor.action.revealDefinition'))
vim.keymap.set('n', 'gy', action('editor.action.goToTypeDefinition'))
vim.keymap.set('n', 'gI', action('editor.action.goToImplementation') )
vim.keymap.set('n', 'gS', action('java.action.navigateToSuperImplementation'))
