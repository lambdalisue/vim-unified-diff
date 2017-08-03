vim-unified-diff
==============================================================================
[![Travis CI](https://img.shields.io/travis/lambdalisue/vim-unified-diff/master.svg?style=flat-square&label=Travis%20CI)](https://travis-ci.org/lambdalisue/vim-unified-diff)
![Version 0.2.0](https://img.shields.io/badge/version-0.2.0-yellow.svg?style=flat-square)
![Support Vim 8.0.0027 or above](https://img.shields.io/badge/support-Vim%208.0.0027%20or%20above-yellowgreen.svg?style=flat-square)
![Support Neovim 0.1.7 or above](https://img.shields.io/badge/support-Neovim%200.1.7%20or%20above-yellowgreen.svg?style=flat-square)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
[![Powered by vital.vim](https://img.shields.io/badge/powered%20by-vital.vim-80273f.svg?style=flat-square)](https://github.com/vim-jp/vital.vim)


A plugin for using diff programs which only support *unified diff* (i.e. `git diff`) in `vimdiff`


INTRODUCTIONS
==============================================================================
This plugins was built mainly for using `git diff --histogram` in `vimdiff`. The following screenshot is a diff mode with vim builtin `diffexpr`

![Builtin diff](https://raw.githubusercontent.com/lambdalisue/vim-unified-diff/misc/img/builtin_diff.png)

It will be turn into

![Histogram diff](https://raw.githubusercontent.com/lambdalisue/vim-unified-diff/misc/img/histogram_diff.png)

via `git diff --histogram` and *vim-unified-diff*

Inspired by http://qiita.com/takaakikasai/items/3d4f8a4867364a46dfa3 and written in pure vimscript.

INSTALL
==============================================================================

```vim
NeoBundle 'lambdalisue/vim-unified-diff'
Plug 'lambdalisue/vim-unified-diff'
```

USAGE
==============================================================================

```vim
set diffexpr=unified_diff#diffexpr()

" configure with the followings (default values are shown below)
let unified_diff#executable = 'git'
let unified_diff#arguments = [
      \   'diff', '--no-index', '--no-color', '--no-ext-diff', '--unified=0',
      \ ]
let unified_diff#iwhite_arguments = [
      \   '--ignore-all-space',
      \ ]
```
