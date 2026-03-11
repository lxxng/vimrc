if v:version < 800
    finish
endif

augroup fFtTHighlight | autocmd!
    function! fFtT#hl_group()
        highlight fFtTColor term=reverse,bold cterm=reverse,bold gui=reverse,bold
    endfunction
    autocmd ColorScheme * call fFtT#hl_group()
    autocmd SafeState * call fFtT#clear()
    call fFtT#hl_group()
augroup END

let s:id = 0
let s:winid = 0

function! fFtT#clear()
    if s:id > 0
        let s:id = s:id->matchdelete(s:winid)
        redraw
    endif
endfunction

function! fFtT#draw(locations)
    if !a:locations->empty()
        if s:id > 0
            call matchdelete(s:id, s:winid)
        endif
        let s:winid = win_getid()
        let s:id = matchaddpos('FfTtColor', a:locations, 1001)
        redraw
    endif
endfunction


function! fFtT#locations(operator)
    let reverse = a:operator =~# '[FT]'
    let [_, lnum, col_byte, _] = getpos('.')
    let [_,    _, col_char, _] = getcharpos('.')
    let line = reverse ? getline('.')->slice(0, col_char - 1)->reverse() 
                     \ : getline('.')->slice(col_char)
    return line->str2list()
              \->map({ -> nr2char(v:val)})
              \->reduce({ dict, char -> extend(dict, { char : dict->get(char, 0) + 1 })}, {})
              \->items()
              \->filter({_,item -> item[1]>=#v:count1})
              \->map({_,item -> reverse ? 
                             \[lnum, col_byte - matchend(line, item[0], 0, v:count1)]
                             \ :
                             \[lnum, col_byte + match   (line, item[0], 0, v:count1) + 1 ] })
endfunction

function! fFtT#ft(operator)
    call fFtT#locations(a:operator)->fFtT#draw()
    return a:operator
endfunction

nnoremap <silent><expr> f fFtT#ft('f')
xnoremap <silent><expr> f fFtT#ft('f')
onoremap <silent><expr> f fFtT#ft('f')
nnoremap <silent><expr> F fFtT#ft('F')
xnoremap <silent><expr> F fFtT#ft('F')
onoremap <silent><expr> F fFtT#ft('F')
nnoremap <silent><expr> t fFtT#ft('t')
xnoremap <silent><expr> t fFtT#ft('t')
onoremap <silent><expr> t fFtT#ft('t')
nnoremap <silent><expr> T fFtT#ft('T')
xnoremap <silent><expr> T fFtT#ft('T')
onoremap <silent><expr> T fFtT#ft('T')
