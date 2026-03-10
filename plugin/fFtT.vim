if v:version < 800
    finish
endif

function! fFtT#hl_group()
    highlight fFtTColor term=reverse,bold cterm=reverse,bold gui=reverse,bold
endfunction
augroup fFtTHighlight | autocmd!
    autocmd ColorScheme * call fFtT#hl_group()
    autocmd SafeState * call fFtT#clear()
augroup END
call fFtT#hl_group()

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
    let [_, lnum, col, _] = getpos('.')
    let list = getline('.')->str2list()->map({_,nr->nr->nr2char()})
    let list = reverse ? list->slice(0, col - 1)->reverse() : list->slice(col)
    let dict = list->reduce({ dict, char -> extend(dict, { char : dict->get(char, 0) + 1 })}, {})
    let line = list->map({_,char->char->char2nr()})->list2str()
    return dict->items()
              \->filter({_,item->item[1]>=#v:count1})
              \->map({_,item->[lnum, (reverse ? -1 : 1) * (1 + match(line, item[0], 0, v:count1)) + col]})
endfunction
function! fFtT#ft(operator)
    let locations = fFtT#locations(a:operator)
    call fFtT#draw(locations)
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
