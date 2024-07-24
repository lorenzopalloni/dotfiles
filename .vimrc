set nocompatible  " set no compatible with old version of VI

"""""""""""""""""""""""""""""""""""""""""
" Plugin Initialization
call plug#begin('~/.vim/plugged')
" themes (further configuration below)
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'acarapetis/vim-colors-github'
Plug 'Luxed/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/everforest'
" utilities
Plug 'vim-airline/vim-airline'
call plug#end()
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""

syntax enable

"""""""""""""""""""""""""""""""""""""""""
" Disable parentheses matching
" source: https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FckThatMatchParen()
augroup END
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""

" General Settings
"set nowrap  " do not wrap portions of text that overflow the window width
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

"""""""""""""""""""""""""""""""""""""""""
" Theme Settings
if has("termguicolors")
  set termguicolors
endif
call togglebg#map("<F5>")  " press F5 to toggle light/dark
set background=light
colorscheme PaperColor
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Default Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent  " indent the new line when the previous is indented
set expandtab  " replace tab with spaces
set colorcolumn=

" Language-specific settings
augroup filetype_settings
    autocmd!
    autocmd FileType python setlocal colorcolumn=79
    autocmd FileType c,cpp,h,hpp,json,ino setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=79
    autocmd FileType sh,bash,zsh setlocal colorcolumn=79
    autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=
    autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=79
    autocmd FileType matlab setlocal colorcolumn=79
    autocmd FileType java setlocal colorcolumn=79
augroup END
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

