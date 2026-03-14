" PlugVim加载插件
function! Plug(repo, cond, ...)
    let opts = get(a:000, 0, {})
    call plug#(a:repo, a:cond ? opts : extend(opts, { 'on': [], 'for': [] }))
    return a:cond
endfunction
command! -nargs=+ -bar PlugIf call Plug(<args>)

call plug#begin(g:vimdir . '/plugged')
Source vim/plugins/basic.vim
if !exists('g:vscode')
    Source vim/plugins/filetree.vim
    Source vim/plugins/git.vim
    Source vim/plugins/fuzzy.vim
    Source vim/plugins/colorscheme.vim
endif

PlugIf 'folke/lazy.nvim', has('nvim')
call plug#end()
