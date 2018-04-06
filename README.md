# vim-status

This is for my personal plugin to store all the functions for my custom statusline.
 You can use it following the dependencies.

## Dependency

[vim-gitbranch](https://github.com/itchyny/vim-gitbranch)

## Installation

use vim-plug :

    Plug 'itchyny/vim-gitbranch'
    Plug 'enanajmain/vim-status'

## Uses

See the [documentation](doc/status.txt) for the plugin to see the functions you can use.

My own vimrc looks something like this:
    set laststatus=2
    set statusline=\ %{status#filename()}
    set statusline+=%{status#readOnly('')}
    "set statusline+=\ %{status#gitInfo('')}
    set statusline+=%{status#gitInfo('')}
    set statusline+=\ %{status#modified('[+]')}
    set statusline+=%=
    set statusline+=%-14.(%l:%c%V%)
    set statusline+=%{status#filetype()}
    set statusline+=\ %5p%%\ 
    hi StatusLine guibg=gray guifg=black
    hi StatusLineNC guibg=#44475a guifg=gray

