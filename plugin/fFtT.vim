if v:version < 800
  finish
endif
function! FfTtColor()
  highlight FfTtColor term=reverse,bold cterm=reverse,bold gui=reverse,bold
endfunction
call FfTtColor()
autocmd ColorScheme * call FfTtColor()
let s:id = 0
let s:winid = 0
function! HighlightClear()
    if s:id > 0
        let s:id = matchdelete(s:id, s:winid)
        :redraw
        let s:id = 0
    endif
    return ''
endfunction

augroup fFtTHighlight | autocmd!
    autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave,SafeState * call HighlightClear()
augroup END

" Gather locations of characters to be dimmed.
function! HighlightChars(s)
    let [_, lnum, col, _] = getpos('.')
    let line = getline('.')
    " Extended ASCII characters can pose a challenge if we simply iterate over
    " bytes. It is preferable to let Vim split the line by characters for more
    " accurate handling.
    let found = {}
    for ch in line->split('\zs')
        if !found->has_key(ch)
            let found[ch] = 1
        endif
    endfor

    let [start, reverse] = (a:s =~ '\C[ft]') ? [col, v:false] : [col - 2, v:true]
    let locations = []
    let freq = {}
    let maxloc = max([100, &lines * &columns])
    for ch in found->keys()
        let loc = reverse ? line->strridx(ch, start) : line->stridx(ch, start)
        while loc != -1
            let freq[ch] = freq->get(ch, 0) + 1
            if freq[ch] > maxloc
                " If we encounter a super long line, there's no need to
                " search for locations that are off screen.
                break
            endif
            if freq[ch] == v:count1
                let locations = add(locations, [lnum, loc + 1])
            endif
            let loc = reverse ? line->strridx(ch, loc - 1) : line->stridx(ch, loc + 1)
        endwhile
    endfor

    if !locations->empty()
        if s:id > 0
            let s:id = matchdelete(s:id, s:winid)
        endif
        let s:winid = win_getid()
        let s:id = matchaddpos('FfTtColor', locations, 1001)
        :redraw
    endif
    return ''
endfunction

nnoremap <silent><expr> f HighlightChars('f') .. 'f'
xnoremap <silent><expr> f HighlightChars('f') .. 'f'
onoremap <silent><expr> f HighlightChars('f') .. 'f'
nnoremap <silent><expr> F HighlightChars('F') .. 'F'
xnoremap <silent><expr> F HighlightChars('F') .. 'F'
onoremap <silent><expr> F HighlightChars('F') .. 'F'
nnoremap <silent><expr> t HighlightChars('t') .. 't'
xnoremap <silent><expr> t HighlightChars('t') .. 't'
onoremap <silent><expr> t HighlightChars('t') .. 't'
nnoremap <silent><expr> T HighlightChars('T') .. 'T'
xnoremap <silent><expr> T HighlightChars('T') .. 'T'
onoremap <silent><expr> T HighlightChars('T') .. 'T'
