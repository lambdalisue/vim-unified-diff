let s:Job = vital#unified_diff#import('System.Job')
let s:String = vital#unified_diff#import('Data.String')
let s:t_string = type('')


function! s:parse_unified_region(line) abort
  let m = matchlist(a:line, '\v^\@\@ \-(\d+)%(,(\d+))? \+(\d+)%(,(\d+))? \@\@')
  if empty(m)
    throw printf(
          \ 'vim-unified-diff: invalid format "%s" was specified',
          \ a:line
          \)
  endif
  let m = m[1 : 4]
  " find correct action
  if m[1] ==# '0'
    let a = 'a'
  elseif m[3] ==# '0'
    let a = 'd'
  else
    let a = 'c'
  endif
  " find correct endpoint
  let send = ''
  if !empty(m[1]) && m[1] !=# '0'
    let send = printf(',%d', m[0] + m[1] - 1)
  endif
  let dend = ''
  if !empty(m[3]) && m[3] !=# '0'
    let dend = printf(',%d', m[2] + m[3] - 1)
  endif
  return join([m[0], send, a, m[2], dend], '')
endfunction

function! s:parse_unified(unified) abort
  let _normal = []
  for line in a:unified
    if line =~# '\v^%(\+\+\+|\-\-\-)'
      continue
    elseif line =~# '\v^\@\@ \-%(\d+)%(,\d+)? \+%(\d+)%(,\d+)? \@\@'
      call add(_normal, s:parse_unified_region(line))
    elseif line =~# '\v^\-'
      call add(_normal, substitute(line, '\v^\-', '< ', ''))
    elseif line =~# '\v^\+'
      if _normal[-1] =~# '\v^\< '
        call add(_normal, '---')
      endif
      call add(_normal, substitute(line, '\v^\+', '> ', ''))
    endif
  endfor
  return _normal
endfunction

function! s:on_stdout(job, msg, event) abort dict
  let leading = get(self.stdout, -1, '')
  silent! call remove(self.stdout, -1)
  call extend(self.stdout, [leading . get(a:msg, 0, '')] + a:msg[1:])
endfunction


function! unified_diff#parse(unified) abort
  let unified = type(a:unified) == s:t_string
        \ ? s:String.split_posix_text(a:unified)
        \ : a:unified
  return s:parse_unified(a:unified)
endfunction

function! unified_diff#diff(fname_in, fname_new) abort
  let args = [g:unified_diff#executable]
  call extend(args, g:unified_diff#arguments)
  if &diffopt =~# 'iwhite'
    call extend(args, g:unified_diff#iwhite_arguments)
  endif
  call extend(args, [a:fname_in, a:fname_new])
  let job = s:Job.start(args, {
        \ 'stdout': [],
        \ 'on_stdout': function('s:on_stdout'),
        \})
  call job.wait()
  return job.stdout
endfunction

function! unified_diff#diffexpr() abort
  let unified = unified_diff#diff(v:fname_in, v:fname_new)
  let diff = s:parse_unified(unified)
  call writefile(diff, v:fname_out)
endfunction
