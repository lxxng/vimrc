local vscode = require('vscode')
vim.notify = vscode.notify
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function() vscode.call(rhs) end, { silent = true, noremap = true })
end
map('n', '<Leader>ef', 'workbench.files.action.showActiveFileInExplorer')

map('n', '<Leader>ff', 'workbench.action.quickOpen')
map('n', '<Leader>fg', 'workbench.action.quickTextSearch')

map('n', ']e', 'editor.action.marker.next')
map('n', '[e', 'editor.action.marker.prev')
map('n', ']c', 'workbench.action.editor.nextChange')
map('n', '[c', 'workbench.action.editor.previousChange')

map('n', '<Leader>r', 'editor.action.rename')
map('n', '<Leader>l', 'editor.action.formatDocument')
map('x', '<Leader>l', 'editor.action.formatSelection')
map('n', '<Tab>', 'editor.action.inlineSuggest.commit')
map('n', '<Leader>o', 'editor.action.organizeImports')
map('n', '<Leader>i', 'editor.action.quickFix')

map('n', 'gR', 'editor.action.goToReferences')
map('n', 'gd', 'editor.action.revealDefinition')
map('n', 'gy', 'editor.action.goToTypeDefinition')
map('n', 'gI', 'editor.action.goToImplementation')
map('n', 'gS', 'java.action.navigateToSuperImplementation')


-- 折叠
map('n', 'zM', 'editor.foldAll')
map('n', 'zR', 'editor.unfoldAll')
map('n', 'zc', 'editor.fold')
map('n', 'zC', 'editor.foldRecursively')
map('n', 'zo', 'editor.unfold')
map('n', 'zO', 'editor.unfoldRecursively')
map('n', 'za', 'editor.toggleFold')
vim.keymap.set('n', 'j', function()
  if vim.v.count == 0 then
    vscode.call('cursorDown')
  else
    return 'j'
  end
end, { expr = true })

vim.keymap.set('n', 'k', function()
  if vim.v.count == 0 then
    vscode.call('cursorUp')
  else
    return 'k'
  end
end, { expr = true })
