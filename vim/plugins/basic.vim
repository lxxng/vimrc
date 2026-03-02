" default
Plug 'tpope/vim-sensible'     " 默认配置
Plug 'tpope/vim-repeat'       " 重复 .
Plug 'kana/vim-textobj-user'  " 自定义文本对象
" operator
Plug   'tpope/vim-surround'                         " 环绕 y/c/d+s
PlugIf 'tpope/vim-commentary', !exists('g:vscode')  " 注释 gc
Plug   'inkarkat/vim-ReplaceWithRegister'           " 替换 gr
Plug   'junegunn/vim-easy-align'                    " 对齐 ga
nmap    ga  <Plug>(EasyAlign)
xmap    ga  <Plug>(EasyAlign)
Plug   'tommcdo/vim-exchange'                       " 互换操作 cx

" motion
Plug 'kana/vim-textobj-entire'          " 全文文本对象 i/a e
Plug 'michaeljsmith/vim-indent-object'  " 缩进文本对象 i/a i/I
" Plug 'vim-scripts/argtextobj.vim'     " 参数文本对象 i/a a

" 其他
if Plug('machakann/vim-highlightedyank', !exists('g:vscode')) " 复制高亮
    if !exists('##TextYankPost')
        nmap y <Plug>(highlightedyank)
        xmap y <Plug>(highlightedyank)
        omap y <Plug>(highlightedyank)
    endif
    let g:highlightedyank_highlight_duration = 2000
endif

Plug 'haya14busa/vim-asterisk' " 星号*井号#搜索增强
let g:asterisk#keeppos = 1 " 保持光标位置
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

Plug 'kana/vim-arpeggio' " 允许同时按键的映射
call plug#load('vim-arpeggio')  " 立刻加载
if exists('g:loaded_arpeggio')
    if !exists('g:vscode')  " vscode不支持insert模式
        Arpeggio inoremap jk <Esc>
    endif
    Arpeggio nnoremap io  :
endif

if Plug('simeji/winresizer', !exists('g:vscode')) " 窗口大小
    let g:winresizer_enable = 1
    let g:winresizer_start_key = '<C-W><C-E>' " window大小
    let g:winresizer_gui_enable = 1
    let g:winresizer_gui_start_key = '<C-W><C-A>' " gui大小
    let g:winresizer_vert_resize = 1
    let g:winresizer_horiz_resize = 1
endif

" vim8
if Plug('LunarWatcher/auto-pairs', v:version >= 800 && !has('nvim'))  " 自动括号
    " 右边为非空字符时不自动添加括号
    let g:AutoPairsCompleteOnlyOnSpace = 1
endif

PlugIf 'chrisbra/matchit', v:version >= 800 && !has('nvim')         " 百分号%匹配

if Plug('mg979/vim-visual-multi', v:version >= 800 && !has('nvim')) " 多光标
    let g:VM_maps                    = {}
    let g:VM_maps['Undo']            = 'u'
    let g:VM_maps['Redo']            = '<C-r>'
    let g:VM_maps['Find Under']      = '<A-n>'        " 单词
    let g:VM_maps['Add Cursor Down'] = '<A-Down>'     " 字符
    let g:VM_maps['Add Cursor Up']   = '<A-Up>'       " 字符
    let g:VM_maps['Mouse Cursor']    = '<A-LeftMouse>'
    let g:VM_maps['Mouse Word']      = '<A-RightMouse>'
    let g:VM_maps['Switch Mode']     = '<Tab>'
endif

PlugIf 'skywind3000/asyncrun.vim', v:version >= 800 && !exists('g:vscode')      " 异步运行
if Plug('skywind3000/asynctasks.vim', v:version >= 800 && !exists('g:vscode'))  " 异步任务
    if has('win32')
        " windows系统使用GBK
        let g:asyncrun_encs = 'gbk'
    endif
    " 自动打开copen
    let g:asyncrun_open = 6
    nnoremap <Leader>t :AsyncTask 
endif

PlugIf 'yianwillis/vimcdoc', !exists('g:vscode')
