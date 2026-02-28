let g:vimdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:vimdir = substitute(g:vimdir, '\v^([a-z]):([\/])', '\u\1:\2', '')
let g:vimdir = substitute(g:vimdir, '\', '/', 'g')
let g:vimrc = g:vimdir . '/vimrc'

command! -nargs=1 Source execute 'source ' . g:vimdir . '/' . '<args>'

execute 'set runtimepath+=' . g:vimdir
let &packpath = &runtimepath

" 优先加载
Source vim/configs/gg_example.vim

" 加载基础配置(set)
Source vim/setting.vim
" 加载映射(map)
Source vim/mapping.vim
" 加载vim的配置
if !exists('g:vscode')
    Source vim/vim.vim
endif
" 加载vim插件(vim-plug)
Source vim/plugin.vim
if has('nvim')
    " 加载neovim的配置
    lua require('configs.neovim')
    if exists('g:neovide')
        " 加载neovide的配置
        lua require('configs.neovide')
    endif
    if exists('g:vscode')
        " 加载vscode的配置
        lua require('configs.vscode')
    endif
    lua require('configs.lazy')
endif

" 最后加载
Source vim/configs/G_example.vim
