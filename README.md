## Deprecated

[Vim 8.1.0360](https://github.com/vim/vim/commit/e828b7621cf9065a3582be0c4dd1e0e846e335bf) introduce `algorithm:{text}` to `diffopt` and natively supports the following algorithms

- myers (default)
- minimal
- patience
- histogram

So that if you use this plugin to use one of the above algorithm, the plugin is no longer required and use setting like below:

```vim
set diffopt& diffopt+=algorithm:histogram,indent-heuristic
```

See `:help diffopt` for detail.

# vim-unified-diff
[![Travis CI](https://img.shields.io/travis/lambdalisue/vim-unified-diff/master.svg?style=flat-square&label=Travis%20CI)](https://travis-ci.org/lambdalisue/vim-unified-diff)
![Version 0.2.1](https://img.shields.io/badge/version-0.2.1-yellow.svg?style=flat-square)
![Support Vim 8.0.0027 or above](https://img.shields.io/badge/support-Vim%208.0.0027%20or%20above-yellowgreen.svg?style=flat-square)
![Support Neovim 0.1.7 or above](https://img.shields.io/badge/support-Neovim%200.1.7%20or%20above-yellowgreen.svg?style=flat-square)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
[![Powered by vital.vim](https://img.shields.io/badge/powered%20by-vital.vim-80273f.svg?style=flat-square)](https://github.com/vim-jp/vital.vim)

This plugin is a plugin to use an external diff program which only support
unified-diff in `vimdiff`.

In default, it uses `git diff --histogram` so that installing this plugin
automatically improve your `vimdiff` quality.

For example

![Builtin diff](https://raw.githubusercontent.com/lambdalisue/vim-unified-diff/misc/img/builtin_diff.png)

It will be turn into

![Histogram diff](https://raw.githubusercontent.com/lambdalisue/vim-unified-diff/misc/img/histogram_diff.png)

by this plugin.

Inspired by http://qiita.com/takaakikasai/items/3d4f8a4867364a46dfa3 and written in pure vimscript.

## INSTALL

```vim
NeoBundle 'lambdalisue/vim-unified-diff'
Plug 'lambdalisue/vim-unified-diff'
```

## USAGE

Once users install this plugin, it automatically configures `diffexpr`.
To disable it, assign 0 to `g:unified_diff_enabled` variable.
