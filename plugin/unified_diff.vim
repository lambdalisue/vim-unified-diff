"*****************************************************************************
" unified diff
"
" Author:   Alisue <lambdalisue@hashnote.net>
" URL:      http://hashnote.net/
" License:  MIT license
" (C) 2014, Alisue, hashnote.net
"*****************************************************************************

let s:save_cpo = &cpo
set cpo&vim


let s:settings = {
      \ 'executable': 'git',
      \ 'arguments': [
      \   'diff',
      \   '--unified=0',
      \   '--no-index', '--no-color', '--no-ext-diff',
      \   '--histogram',
      \ ],
      \ 'iwhite_arguments': [
      \   '--ignore-all-space',
      \ ],
      \}
function! s:init() " {{{
  for [key, value] in items(s:settings)
    if !exists('g:unified_diff#' . key)
      let g:unified_diff#{key} = value
    endif
    unlet value
  endfor
endfunction
call s:init()
" }}}

let &cpo = s:save_cpo
unlet s:save_cpo
"vim: sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
