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
