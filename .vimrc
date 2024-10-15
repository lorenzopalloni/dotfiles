set nocompatible  " set no compatible with old version of VI

"""""""""""""""""""""""""""""""""""""""""
" Plugin Initialization
call plug#begin('~/.vim/plugged')

" Color themes (further configuration below)
Plug 'NLKNguyen/papercolor-theme'
"Plug 'altercation/vim-colors-solarized'
"Plug 'morhetz/gruvbox'
"Plug 'Luxed/ayu-vim'
"Plug 'sainnhe/everforest'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'kkoomen/vim-doge'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'

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
    autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=
    autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=79
    autocmd FileType matlab setlocal colorcolumn=79
    autocmd FileType java setlocal colorcolumn=79
augroup END
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Plugin Settings

" coc.nvim settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" GitHub Copilot settings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" ALE settings
let g:ale_linters = {
    \ 'python': ['flake8', 'mypy'],
    \ 'cpp': ['clangd'],
    \ }

" doge settings
let g:doge_enable_mappings = 1

" NERDTree mapping
nmap <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
" " Disable parentheses matching
" " source: https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
" " Disable parentheses matching depends on system. This way we should address all cases (?)
" set noshowmatch
" " NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" " Trying disable MatchParen after loading all plugins
" "
" function! g:FckThatMatchParen ()
"     if exists(":NoMatchParen")
"         :NoMatchParen
"     endif
" endfunction
"
" augroup plugin_initialize
"     autocmd!
"     autocmd VimEnter * call FckThatMatchParen()
" augroup END
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""

