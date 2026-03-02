noremap  <Leader>  <Nop>
" 1. 基础映射 
" 1.1 更符合逻辑的映射
map Y y$
" 1.1 删除不进入缓存
noremap  s  "_s
noremap  S  "_S
noremap  x  "_x
noremap  X  "_X
noremap <Leader>c "_c
noremap <Leader>C "_C
noremap <Leader>d "_d
noremap <Leader>D "_D
" 1.2 水平移动时保留光标
xnoremap  <  <gv
xnoremap  >  >gv
" 1.3 方向键与Esc键
if g:config_keyboard == 0
    noremap <C-H>  <Left>|inoremap <C-H>  <Left>|cnoremap <C-H>  <Left>
    noremap <C-J>  <Down>|inoremap <C-J>  <Down>|cnoremap <C-J>  <Down>
    noremap <C-K>    <Up>|inoremap <C-K>    <Up>|cnoremap <C-K>    <Up>
    noremap <C-L> <Right>|inoremap <C-L> <Right>|cnoremap <C-L> <Right>
    inoremap  jk  <Esc>
    inoremap  jj  j
endif
" 1.4 不常用的HLM键
noremap  H  ^
noremap  L  $
map      M  %
" 1.5 命令行模式 与Shell保持一致
cnoremap  <C-A>  <Home>
if has('terminal')
    tnoremap  <C-A>  <Home>
    tnoremap  <C-E>  <End>
endif