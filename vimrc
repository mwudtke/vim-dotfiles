filetype plugin indent off      " for turning pathogen on

call pathogen#infect()                      " use pathogen  - understand these better???
"call pathogen#runtime_append_all_bundles()  " use pathogen

if $TERM == "xterm-256color"   " should enable 256 colors 
    set t_Co=256                 " was 256, trying this for solarized
endif

filetype plugin indent on       " for filetype indentation

set lines=50 columns=110        " setting initial window size

syntax enable           " enable syntax processing
set background=dark
colorscheme solarized         " awesome colorscheme

set tabstop=4       " number of visual spaces per TAB

set softtabstop=4   " number of spaces in tab when editing

set expandtab       " tabs are spaces

set autoindent      " hopefully auto indents

set number              " show line numbers

set showcmd             " show command in bottom bar

"set cursorline          " highlight current line

set wildmenu            " visual autocomplete for command menu

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" jk is escape
inoremap jk <esc>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Have vim remember last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
