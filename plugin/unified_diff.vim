if exists('g:unified_diff_loaded')
  finish
endif
let g:unified_diff_loaded = 1

if get(g:, 'unified_diff_enabled', 1)
  set diffexpr=unified_diff#diffexpr()
endif
