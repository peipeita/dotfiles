syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=2            " Fix backspace behavior on most terminals.

colorscheme delek         " Change a colorscheme.

set directory=$HOME/.vim/swap// " Collect all swap file in the dir. 

set undofile                    " Store undo in a file
if !isdirectory(expand("$HOME/.vim/undodir"))
        call mkdir(expand("$HOME/.vim/undodir"), "p")
endif 
set undodir=$HOME/.vim/undodir
set wildmenu
set wildmode=list:longest,full
set hlsearch

set foldmethod=indent
autocmd BufRead * normal zR

set clipboard=unnamed,unnamedplus   " Set *, + clipboards available

inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i