" 1. 通用
" 取消兼容模式
set nocompatible
" 历史命令数量
set history=500
" 不显示默认启动信息
set shortmess+=I
" 取消提示音
set noerrorbells 
set visualbell 
set t_vb=
autocmd VimEnter * set t_vb=

" 2. 键入
" 共享系统剪切板
set clipboard^=unnamed,unnamedplus
" 鼠标 (不支持共享系统剪切板时不启用鼠标, 鼠标用于复制)
if has('clipboard')
    " :messages 选中后, 用<C-Y>复制
    set mouse+=a
else
    set mouse-=a
endif
" 映射的超时时间
set timeout timeoutlen=1500
" 键码的超时时间 解决部分终端由转义引起的"卡键"现象
set ttimeout ttimeoutlen=10
" 退格键设置
set backspace=eol,start,indent
" Windows禁用Alt菜单
set winaltkeys=no

" 3. 界面
" 不自动换行
set nowrap
" 光标上下两侧最少保留的屏幕行数
set scrolloff=5
" 光标左右两侧最少保留的屏幕列数
set sidescrolloff=20
set sidescroll=1
" 显示光标位置的行号和列号
set ruler
" 显示行号 相对行号
set number relativenumber
" 高亮显示当前行
set cursorline
" 显示搜索匹配数
set shortmess-=S
" 显示当前命令
set showcmd
" 始终显示状态栏
set laststatus=2
" 懒重绘
set lazyredraw
" (行号左边的)标号列 yes:始终保留, number:替换行号 (auto:会闪)
if has('signs') && v:version >= 800
    set signcolumn=yes
endif

" 4. 编辑
" 命令行补全
set wildmenu
if v:version >= 900 || has('nvim')
    set wildoptions=fuzzy,pum
endif
" 搜索智能大小写 高亮 动态显示
set ignorecase smartcase hlsearch incsearch
nohlsearch
" 显示匹配的括号
set showmatch
" 将Tab替换为空格
set expandtab
" 智能Tab
set smarttab
" 缩进
set shiftwidth=4
set tabstop=4
set autoindent smartindent
" 正则表达式引擎
set regexpengine=0
" 替换时默认为全局替换
set gdefault
" <C-A>和<C-X> 处理数字格式(二进制, 十六进制, 无符号数)
if v:version >= 800
    set nrformats=hex,bin,unsigned
endif

" 5. 文件
" 根据文件类型自动设置缩进
filetype plugin indent on
" 文件被外部修改后自动读入
set autoread
autocmd FocusGained,BufEnter * checktime
" 允许不保存跳转buffer
set hidden
" 备份文件
set nobackup 
set nowritebackup 
set noswapfile

" 6. 编码
" 内部工作编码
set encoding=utf-8
" 文件默认编码
set fileencoding=utf-8
" 打开文件时自动尝试下面顺序的编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
" 文件换行符，默认使用 unix 换行符
set fileformats=unix,dos,mac

" 7. 样式
" 高亮
if !exists('g:syntax_on')
    syntax enable
endif
" 真色彩
if has('termguicolors')
  set termguicolors
endif
set t_Co=256
" 8. GUI
if has('gui_running')
    set guioptions-=T " 取消工具栏
    set guioptions-=e " 取消标签
    set guioptions-=m " 取消菜单栏
    set guioptions-=L " 取消左侧滚动条
    set columns=120 " 宽
    set lines=30 " 高
    set guicursor+=a:blinkon0 " 取消光标闪烁
endif
