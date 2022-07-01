set nocompatible  " set no compatible with old version of VI
filetype off  " required by Vundle

""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    " themes (further configuration below)
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'morhetz/gruvbox'
    Plugin 'acarapetis/vim-colors-github'
    " utilities
    Plugin 'vim-airline/vim-airline'
call vundle#end()
""""""""""""""""""""""""""""""""""""""""

syntax enable

set nowrap  " do not wrap portions of text that overflow the window width
set clipboard^=unnamedplus  " interactive Ctrl-C/Ctrl-V
set showmode  " show insert/replace/visual mode
set number relativenumber  " show line numbers (relative)
set belloff=all  " disable all sounds
set ttyfast  " more characters will be sent to the screen for redrawing
"set cursorline  " highlight current line
"set ruler  " show the cursor position all the time
"set showmatch  " highlight matching braces

" time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

" disable file backup
set nobackup
set noswapfile

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set path+=**  " Search down into subfolders
set wildmenu  " display all the completitions when tab completing

" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*.class,*.pyc
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif,*jpeg,*tif,*tiff

set spelllang=en_us,en ",it  " spell checking

" remove trailing whitespace when saving.
" to disable it: ":autocmd!"
"autocmd BufWrite * silent! %s/[ \t\r]\+$//  " old command
"autocmd BufWritePre * :%s/\s\+$//e  " new command

" themes
set background=dark
"call togglebg#map("<F5>")  " press F5 to toggle light/dark
"colorscheme gruvbox
"let g:gruvbox_termcolors=256
"colorscheme solarized
"let g:solarized_termcolors=256

""""""""""""""""""""""""""""""""""""""""
" default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent  " indent the new line when the previous is indented
set expandtab  " replace tab with spaces
set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" Python
autocmd BufNewFile,BufRead *.py
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" C/C++ (Google C++ Style Guide)
autocmd BufNewFile,BufRead *.h,*.c,*.hpp,*.cc,*.cpp
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" Shell
autocmd BufNewFile,BufRead *.*sh
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" Markdown
autocmd BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set colorcolumn=79  " no colorcolumn
""""""""""""""""""""""""""""""""""""""""
" LaTex
autocmd BufNewFile,BufRead *.tex
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" Matlab
autocmd BufNewFile,BufRead *.m
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""
" Java
autocmd BufNewFile,BufRead *.java
    \ set colorcolumn=79
""""""""""""""""""""""""""""""""""""""""

