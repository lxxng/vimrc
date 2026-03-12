Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
if Plug('airblade/vim-gitgutter', !has('nvim'))
  let g:gitgutter_preview_win_floating = 1
  nnoremap <silent>  ]c  <Esc>:<C-U>call GitGutterNextCycleHunk()<CR>
  nnoremap <silent>  [c <Esc>:<C-U>call GitGutterPrevCycleHunk()<CR>
  function! GitGutterNextCycleHunk()
    let current_line = line('.')
    let hunks = GitGutterGetHunks()
    for hunk in hunks
      if hunk[2] > current_line
        execute 'normal! ' . hunk[2] . 'G'
        return
      endif
    endfor
    if len(hunks) >= 1
      execute 'normal! ' . hunks[0][2] . 'G'
    endif
  endfunction
  function! GitGutterPrevCycleHunk()
    let current_line = line('.')
    let hunks = GitGutterGetHunks()
    for hunk in reverse(copy(hunks))
      if hunk[2] < current_line
        execute 'normal! ' . hunk[2] . 'G'
        return
      endif
    endfor
    if len(hunks) >= 1
      execute 'normal! ' . hunks[len(hunks) - 1][2] . 'G'
    endif
  endfunction
endif
