local vim = vim
local vscode = require('vscode')
local action = function(...)
    local args = {...}
    return function()
        ---@diagnostic disable-next-line: deprecated
        require('vscode').action(unpack(args))
    end
end

vim.keymap.set('n', '<Leader>ef', action('workbench.files.action.showActiveFileInExplorer'))

vim.keymap.set('n', '<Leader>ff', action('workbench.action.quickOpen') )
vim.keymap.set('n', '<Leader>fg', action('workbench.action.quickTextSearch') )

vim.keymap.set('n', ']e', action('editor.action.marker.next'))
vim.keymap.set('n', '[e', action('editor.action.marker.prev'))
vim.keymap.set('n', ']c', action('workbench.action.editor.nextChange'))
vim.keymap.set('n', '[c', action('workbench.action.editor.previousChange'))

vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
vim.keymap.set({'n','x'}, '<Leader>l', vim.lsp.buf.format)
vim.keymap.set('n', 'gR', action('editor.action.goToReferences'))
vim.keymap.set('n', 'gd', action('editor.action.revealDefinition'))
vim.keymap.set('n', 'gy', action('editor.action.goToTypeDefinition'))
vim.keymap.set('n', 'gI', action('editor.action.goToImplementation') )
vim.keymap.set('n', 'gS', action('java.action.navigateToSuperImplementation'))
