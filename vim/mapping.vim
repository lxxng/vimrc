noremap  <Leader>  <Nop>
" 1. 基础映射 
" 1.1 更符合逻辑的映射
nmap Y y$
xmap Y y$
omap Y y$

" 1.1 删除不进入缓存
nnoremap  s  "_s
xnoremap  s  "_s
onoremap  s  "_s

nnoremap  S  "_S
xnoremap  S  "_S
onoremap  S  "_S

nnoremap  x  "_x
xnoremap  x  "_x
onoremap  x  "_x

nnoremap  X  "_X
xnoremap  X  "_X
onoremap  X  "_X

nnoremap <Leader>c "_c
xnoremap <Leader>c "_c
onoremap <Leader>c "_c

nnoremap <Leader>C "_C
xnoremap <Leader>C "_C
onoremap <Leader>C "_C

nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
onoremap <Leader>d "_d

nnoremap <Leader>D "_D
xnoremap <Leader>D "_D
onoremap <Leader>D "_D

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
nnoremap  H  ^
xnoremap  H  ^
onoremap  H  ^

nnoremap  L  $
xnoremap  L  $
onoremap  L  $

nmap      M  %
xmap      M  %
omap      M  %

" 1.5 命令行模式 与Shell保持一致
if has('terminal')
    tnoremap  <C-A>  <Home>
    tnoremap  <C-E>  <End>
endif
