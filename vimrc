:let mapleader=","

:map <M-Esc>[62~ <MouseDown> 
:map! <M-Esc>[62~ <MouseDown> 
:map <M-Esc>[63~ <MouseUp> 
:map! <M-Esc>[63~ <MouseUp> 
:map <M-Esc>[64~ <S-MouseDown> 
:map! <M-Esc>[64~ <S-MouseDown> 
:map <M-Esc>[65~ <S-MouseUp> 
:map! <M-Esc>[65~ <S-MouseUp>
filetype plugin on
"set tags=~/.vim/stdtags,tags,.tags,../tags

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set ai sw=4
" enable mouse wherever
set mouse=a
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
" It's VIM, not VI
set nocompatible

" A tab produces a 2-space indentation
set softtabstop=2
set shiftwidth=2
set expandtab


" Enable filetype detection
filetype on

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab

" Highlight syntax in programming languages
syntax on

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab

" Useful macros for cleaning up code to conform to LLVM coding guidelines

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g


function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf

" Additional vim features to optionally uncomment.
set showcmd
set showmatch
set showmode
set incsearch
set ruler

"Allow copy-pasting
map <C-c> "+y

" Enable pathogen
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"Solarized color scheme
syntax enable
if !has('gui_running')
    " Compatibility for Terminal
    let g:solarized_termtrans=1

    if (&t_Co >= 256 || $TERM == 'xterm-256color')
        " Do nothing, it handles itself.
    else
        " Make Solarized use 16 colors for Terminal support
        let g:solarized_termcolors=16
    endif
endif
colorscheme solarized
hi Normal ctermbg=NONE
set background=dark


" NERDTree
map <F2> :NERDTreeToggle<CR>
"Enable Ctrl+P to paste
map <C-p> :set paste<CR>

" Folds
set foldmethod=indent
set foldlevel=99

" Moving around windows

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" SuperTab plugin

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview


:map <M-Esc>[62~ <MouseDown> 
:map! <M-Esc>[62~ <MouseDown> 
:map <M-Esc>[63~ <MouseUp> 
:map! <M-Esc>[63~ <MouseUp> 
:map <M-Esc>[64~ <S-MouseDown> 
:map! <M-Esc>[64~ <S-MouseDown> 
:map <M-Esc>[65~ <S-MouseUp> 
:map! <M-Esc>[65~ <S-MouseUp>

"set tags=~/.vim/stdtags,tags,.tags,../tags

autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g



" Additional vim features to optionally uncomment.
set showcmd
set showmatch
set showmode
set incsearch
set ruler

"Allow copy-pasting
map <C-c> "+y

" Enable pathogen
call pathogen#infect()
" call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" NERDTree
map <F2> :NERDTreeToggle<CR>
"Enable Ctrl+P to paste
map <C-Y> :set paste<CR>

" Folds
set foldmethod=indent
set foldlevel=99

" Moving around windows

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Let's remember some things, like where the .vim folder is.
if has("win32") || has("win64")
    let windows=1
    let vimfiles=$HOME . "/vimfiles"
    let sep=";"
else
    let windows=0
    let vimfiles=$HOME . "/.vim"
    let sep=":"
endif



nmap <F8> :TagbarToggle<CR>

if has("gui_running")
    set cursorline                  "Highlight background of current line
    autocmd VimEnter * NERDTree     "run nerdtree
    "autocmd VimEnter * TagbarOpen

    " Show tabs and newline characters with ,s
    nmap <Leader>s :set list!<CR>
    set listchars=tab:▸\ ,eol:¬
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
endif

if has("gui_macvim") "Use Experimental Renderer option must be enabled for transparencY
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Menlo\ for\ Powerline:h14
   endif
    map <SwipeLeft> :bprev<CR>
    map <SwipeRight> :bnext<CR>
endif

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif

" Syntax highlighting for clojurescript files
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
" For statusline
set encoding=utf-8
set t_Co=256
autocmd bufwritepost .vimrc source $MYVIMRC
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
