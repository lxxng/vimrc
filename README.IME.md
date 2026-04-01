# 输入法配置

## RIME输入法（默认）

### 小狼毫输入法

通过小狼毫内置 `vim_mode` 功能实现

#### weasel.yaml

~~~yaml
# weasel.yaml
app_options:
  neovide.exe:            # Neovide
    vim_mode: true        #   vim-模式
  Code.exe:               # Visual Studio Code
    inline_preedit: true  #   normal初始中文插入空格的问题
    vim_mode: true        #   vim-模式
  idea64.exe:             # IntelliJ IDEA
    inline_preedit: true  #   normal初始中文插入空格的问题
    vim_mode: true        #   vim-模式
~~~

#### （或者）weasel.custom.yaml

~~~yaml
# weasel.custom.yaml
patch:
  app_options/+:
    neovide.exe:            # Neovide
      vim_mode: true        #   vim-模式
    Code.exe:               # Visual Studio Code
      inline_preedit: true  #   normal初始中文插入空格的问题
      vim_mode: true        #   vim-模式
    idea64.exe:             # IntelliJ IDEA
      inline_preedit: true  #   normal初始中文插入空格的问题
      vim_mode: true        #   vim-模式
~~~

## 其他输入法

#### 在gvim上

##### vim/vim.vim

~~~vimscript
if has('multi_byte_ime')
    augroup IME
        autocmd!
        autocmd VimEnter * set imdisable | set noimdisable
    augroup END
endif
~~~

#### 在neovide上

##### lua/neovide.lua

~~~lua
-- lua/neovide.lua
-- 初始不允许使用输入法
vim.g.neovide_input_ime = false

local ime_input = vim.api.nvim_create_augroup('ime_input', { clear = true })

-- 插入模式允许使用输入法
vim.api.nvim_create_autocmd('InsertEnter', {
    group = ime_input,
    pattern = "*",
    callback = function() vim.g.neovide_input_ime = true end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
    group = ime_input,
    pattern = "*",
    callback = function() vim.g.neovide_input_ime = false end,
})
-- 命令行模式
vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = ime_input,
    callback = function() vim.g.neovide_input_ime = false end,
})
-- 允许通过<C-Space>开启输入法
vim.keymap.set({ 'v', 'n', 'i', 'c', 't' }, '<C-Space>', function() vim.g.neovide_input_ime = true end, { noremap = true })
~~~

#### 在vscode上

##### 安装 Smart Input Pro (Chinese) 插件

##### lazy.nvim添加插件

~~~lua
{
    'szb000801/smart-input-pro.nvim',
    config = function(_, opts)
        require('smart-input-pro').setup()
    end,
}
~~~

#### 在idea上

##### 安装 Smart Input Pro (Chinese) 插件











