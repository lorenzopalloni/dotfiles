set nocompatible  " set no compatible with old version of VI


"""""""""""""""""""""""""""""""""""""""""
" Automatically set up plug-vim environment
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""
" Plugin Initialization
call plug#begin('~/.vim/plugged')

" Color themes (further configuration below)
Plug 'NLKNguyen/papercolor-theme'
"Plug 'altercation/vim-colors-solarized'
"Plug 'morhetz/gruvbox'
"Plug 'Luxed/ayu-vim'
"Plug 'sainnhe/everforest'

" Status line
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'

" File explorer
Plug 'preservim/nerdtree'
" Shortcut: <C-n> to toggle NERDTree sidebar
" Mapping:
nmap <C-n> :NERDTreeToggle<CR>

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Shortcuts:
" :Files - Search files in cwd (Current Working Directory)
" :Rg <search_term> - Search for <search_term> in cwd (requires ripgrep)
" :Buffers - Search and switch between open buffers

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Shortcuts:
" <C-h>, <C-j>, <C-k>, <C-l> - Move between Vim splits and tmux panes

" Autocompletion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shortcuts:
" gd - Go to definition
" gr - Find references
" gi - Go to implementation

" GitHub Copilot

"Plug 'github/copilot.vim'
" Shortcut: <Tab> to accept Copilot suggestion

Plug 'tpope/vim-commentary'
" Shortcuts:
" gcc - Toggle comment on current line
" gc in visual mode - Toggle comment on selected lines

" Linting
Plug 'dense-analysis/ale'
" Shortcuts:
" :ALEFix - Fix linting errors
" :ALEToggle - Toggle linting
" [e - Go to previous linting error
" ]e - Go to next linting error

" Settings:
let g:ale_enabled = 0
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ }

" Shortcuts for text objects
Plug 'tpope/vim-surround'
" Shortcuts:
" ysiw) - Surround inner word with parentheses
" yss" - Surround entire sentence with double quotes
" cs"' - Change surrounding double quotes to single quotes
" ds( - Delete surrounding parentheses

" Syntax Highlighting and indentation
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ["autoindent"]

" DOcumentation GEnerator
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Shortcut: :DogeGenerate - Generate documentation for the current file

" Git integration
Plug 'airblade/vim-gitgutter'

""""""""""""""""""""""""""""""""""""""""
" Plugin Settings

" GitHub Copilot settings
"let g:copilot_no_tab_map = v:true
"imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")

""""""""""""""""""""""""""""""""""""""""

call plug#end()
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" General Settings
syntax on
filetype plugin indent on
set encoding=utf-8
set incsearch

"set nowrap  " do not wrap portions of text that overflow the window width
set clipboard^=unnamedplus  " interactive Ctrl-C/Ctrl-V
set showmode  " show insert/replace/visual mode
set number relativenumber  " show line numbers (relative)
set belloff=all  " disable all sounds
"set cursorline  " highlight current line
"set ruler  " show the cursor position all the time
"set showmatch  " highlight matching braces

" time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

" File Backup
"set nobackup
"set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

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
autocmd BufWritePre * :%s/\s\+$//e  " new command

"""""""""""""""""""""""""""""""""""""""""
" Theme Settings
if has("termguicolors")
  set termguicolors
endif
"call togglebg#map("<F5>")  " press F5 to toggle light/dark
set background=dark
colorscheme PaperColor
" colorscheme gruvbox
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
    autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=79
    autocmd FileType matlab setlocal colorcolumn=79
    autocmd FileType java setlocal colorcolumn=79

    " Disable programming plugins for .txt and .md files
    autocmd FileType markdown,text setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn= |
        \ let b:copilot_enabled = 0 |
        \ let b:coc_enabled = 0 |
        \ let b:ale_enabled = 0 |
        \ let b:gitgutter_enabled = 0
augroup END
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Quick-save/compile keys
set makeprg=make\ -j8

" <F8> : write current file, run :make, show errors in quickfix
nnoremap <silent> <F8> :update<CR>:make<CR>

" <F9> : write, compile, then run the target defined in Makefile
nnoremap <silent> <F9> :update<CR>:make run<CR>

" Open quickfix automatically if :make produced any errors
autocmd QuickFixCmdPost make cwindow

""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

