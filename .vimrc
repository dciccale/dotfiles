""" BUNDLES
so ~/.vim/plugins.vim

""" EDITION
filetype plugin indent on
syntax on
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" always set autoindenting on
set autoindent
set smartindent
" copy the previous indentation on autoindenting
set copyindent
" don't wrap lines
set nowrap
" show line numbers
set number
" highlight current line
set cursorline
" auto load files if vim detects they have been changed outside of Vim
set autoread
set hidden
" ignore some files when autocomplete
set wildignore=*.swp,*.bak,*.pyc

" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById

" keep selection to (in/out)dent
vnoremap < <gv
vnoremap > >gv


" enter key goes to error in quickfix window
au BufWinEnter quickfix nmap <buffer> <Enter> :.cc<CR>

" easy add new line in normal mode
nnoremap <CR> o<ESC>

" easy remove line in normal mode
nnoremap <BS> dd

" make j/k move to next visual line instead of pysical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" do not generate backup nor swap files
set nobackup
set noswapfile


" always do vertical splits at right side
set splitright
" always do horizontal splits below
set splitbelow

" highlight trailing whitespace
" http://nvie.com/posts/how-i-boosted-my-vim/
set list listchars=trail:.,extends:#,nbsp:.
" remove unwanted trailling spaces
autocmd BufWritePre * :%s/\s\+$//e

""" SEARCH
" ignore case when searching
set ignorecase
" show search matches as you type
set incsearch
" highlight search terms
set hlsearch
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" use many undos
set undolevels=1000
" easy remove search highlight
nmap <silent> ,0 :nohlsearch<CR>
" don't move on *
nnoremap * *<C-o>

""" TERMINAL
" change the current working directory to where the current file is on
set autochdir

""" FOLDS
set foldmethod=syntax
" toggle folds with space bar
nnoremap <silent> <Space> za<CR>
vnoremap <Space> zf

""" NAVIGATION
" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" buffer nav
nnoremap <Right> :bnext<CR>
nnoremap <Left>  :bprev<CR>

""" OTHER MAPPINGS
" change the mapleader from \ to ,
let mapleader=","

" - is the new : (i.e. -w to save) faster instead of shift+:
nnoremap - :
" easy :bd
map <Leader>d :bd<CR>
" quick save
map <Leader>w :w<CR>

""" EASY EDIT/SOURCE VIMRC
nnoremap <Leader>ve :split $MYVIMRC<CR>
nnoremap <Leader>vs :so $MYVIMRC<CR>
