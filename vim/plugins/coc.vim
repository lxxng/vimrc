if Plug('neoclide/coc.nvim', !has('nvim'), {'branch': 'release'}) " coc
    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    let g:coc_config_home = g:vimdir
    let g:coc_global_extensions = [
                \ 'coc-marketplace',
                \ 'coc-highlight',
                \ 'coc-lists',
                \ 'coc-prettier',
                \]

    " Tab的实现
    inoremap <silent><expr> <Tab> 
                \ coc#pum#visible() ? coc#pum#confirm() :
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()
    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " <CR>的实现
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-G>u\<CR>\<C-R>=coc#on_enter()\<CR>"

    " function/class text-objects
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)


    " 跳转告警
    noremap  <silent>  [e  <Esc>:<C-u>call GotoError('diagnosticPrevious')<CR>
    noremap  <silent>  ]e  <Esc>:<C-u>call GotoError('diagnosticNext')<CR>
    function! GotoError(action)
        let s:list = CocAction('diagnosticList')
        for obj in s:list
            if has_key(obj, 'severity') && obj.severity == 'Error'
                execute "call CocActionAsync('".a:action."', 'error')"
                return
            endif
        endfor
        execute "call CocActionAsync('".a:action."')"
    endfunction

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gR <Plug>(coc-references)
    "  K       的高级实现
    nnoremap <silent>  K  :call ShowDocumentation()<CR>
    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction

    augroup IdeaVimAction

        " 重命名
        nmap <Leader>r <Plug>(coc-rename)

        " 格式化
        nmap <Leader>l  <Plug>(coc-format)
        xmap <Leader>l  <Plug>(coc-format-selected)

        " 选择
        nmap <silent> <C-S> <Plug>(coc-range-select)
        xmap <silent> <C-S> <Plug>(coc-range-select)

    augroup end


    nmap <Leader>i  <Plug>(coc-codeaction-cursor)
    xmap <Leader>i  <Plug>(coc-codeaction-selected)
    nmap <Leader>;  <Plug>(coc-fix-current)

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " statusline - native
    " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    " statusline - airline
    let g:airline#extensions#coc#enabled = 1

    " Mappings for CoCList
    " Show all diagnostics
    " nnoremap <silent><nowait> <Leader>a  :<C-u>CocList diagnostics<CR>
    " Manage extensions
    " nnoremap <silent><nowait> <Leader>e  :<C-u>CocList extensions<CR>
    " Show commands
    " nnoremap <silent><nowait> <Leader>c  :<C-u>CocList commands<CR>
    " Find symbol of current document
    " nnoremap <silent><nowait> <Leader>o  :<C-u>CocList outline<CR>
    " Search workspace symbols
    " nnoremap <silent><nowait> <Leader>s  :<C-u>CocList -I symbols<CR>
    " Do default action for next item
    " nnoremap <silent><nowait> <Leader>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    " nnoremap <silent><nowait> <Leader>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    " nnoremap <silent><nowait> <Leader>p  :<C-u>CocListResume<CR>
endif
