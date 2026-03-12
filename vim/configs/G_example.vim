" 最后加载
" 清空选择模式的映射
smapclear
" 设置字体
if has('gui_running')
    try
        set guifont=Maple_Mono_Normal_NL_NF_CN:h12
    catch
        try
            set guifont=Consolas:h12
        catch
        endtry
    endtry
endif

" 加载自定义配置
if !empty(matchlist(resolve(expand('<sfile>:p')), 'G_example\.vim$')) && filereadable(expand('<sfile>:h') . '/G.vim')
  source <sfile>:h/G.vim
endif
