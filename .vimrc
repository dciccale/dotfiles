" no vi compatibility
set nocp

" ===================== PLUGINS =====================
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS


" ===================== GVIMRC =====================
" define gvimrc here
if has('gui_running')
  if has('mac')
    set transparency=3
    set guifont=Monaco:h12
  else
    set guifont=Courier_New:h10:cANSI
  endif
endif


" ===================== EDITION =====================
syntax on
filetype on
filetype plugin on
filetype indent on

" always set autoindenting on
set autoindent

" good when starting a new line
set smartindent

" fill tabs with spaces
set expandtab

" tabs have 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" copy the previous indentation on autoindenting
set copyindent

" don't wrap lines
set nowrap

" show line numbers
set number

" highlight current line
set cursorline

" auto load files when hanged outside of Vim
set autoread

" allow hidden buffers
set hidden

" highlight trailing whitespace (and tabs)
" http://nvie.com/posts/how-i-boosted-my-vim/
set list
set listchars=tab:>-,trail:·

" remove unwanted trailling spaces
autocmd BufWritePre * :%s/\s\+$//e
" switch between last two files
nnoremap <Leader><Leader> <c-^>

" ignore some files when autocomplete
set wildignore=*.swp,*.bak,*.pyc

" use many undos
set undolevels=1000

" do not syntax highlight too long lines
set synmaxcol=800

" keep selection to indent/outdent
vnoremap < <gv
vnoremap > >gv

" enter key goes to error in quickfix window
au BufWinEnter quickfix nmap <buffer> <Enter> :.cc<CR>


" ===================== SCROLLING =====================
" show more lines around cursor when at the edge of file
set scrolloff=3
set sidescrolloff=5

" scroll viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>


" ===================== SPELLING =====================
" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById


" ===================== REGISTERS =====================
" may be I will do this and keep only one register (system clipboard)
" anyway I can't keep track of more than one..
" http://stackoverflow.com/a/1290230/194630
"noremap  y "*y
"noremap  Y "*Y
"noremap  p "*p
"noremap  P "*P
"vnoremap y "*y
"vnoremap Y "*Y
"vnoremap p "*p
"vnoremap P "*P


" ===================== MAPPINGS =====================
" change the mapleader from \ to ,
let mapleader=","

" - is the new : (i.e. -w to save) faster instead of shift+:
nnoremap - :

" easy :bd
map <Leader>d :bd<CR>

" quick save
map <Leader>w :w<CR>

" quick source current file
map <Leader>s :so %<CR>

" make j/k move to next visual line instead of pysical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" easy move lines
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" easy add new line in normal mode
nnoremap <CR> o<ESC>

" easy remove line in normal mode
" (copy to _ for not loosing the last clipboard)
nnoremap <BS> "_dd

" easey copy/paste from/to system clipboard
map <Leader>yy "*y
map <Leader>pp "*p
map <Leader>YY "*Y
map <Leader>PP "*P


" ===================== SPLITS =====================
" always do vertical splits at right side
set splitright
" always do horizontal splits below
set splitbelow


" ===================== SEARCH =====================
" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" highlight search when typing
set incsearch

" highlight search terms
set hlsearch

" hide search highlight
nnoremap <Leader>0 :nohls<CR>

" don't move on *
nnoremap * *<C-o>

" ctrl+f vim search not gui
nnoremap <C-f> /

" do not highlight when vim starts
nohls


" ===================== TERMINAL =====================
" disable blinking cursor
set guicursor=a:blinkon0

" always show status bar
set laststatus=2

" my status line
set statusline=%f\ %m\ %r\ Line\ %l\ \ Column\ %v\ \ Buffer\ #%n

" more space to see command line
set cmdheight=2

" get rid of separation chars
set fillchars=""

" http://items.sjbach.com/319/configuring-vim-right
set wildmenu

" set terminal title
set title

" auto cd to the current buffer directory
set autochdir

" do not generate backup nor swap files
set nobackup
set noswapfile

" shorten vim messages
" see :h shortmess for the breakdown of what this changes
set shortmess=atI

" stop annoying noise
set visualbell


" ===================== FOLDS =====================
set foldmethod=syntax

" do not fold automatically
set nofoldenable

" toggle folds with space bar
nnoremap <silent> <Space> za
vnoremap <Space> zf


" ===================== NAVIGATION =====================
" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy tab navigation
map <C-L> :tabNext<CR>

" there is no tabPrev so use next also
map <C-H> :tabNext<CR>

" buffer navigation with arrow keys
nnoremap <Right> :bnext<CR>
nnoremap <Left>  :bprev<CR>


" ===================== EDIT VIMRC =====================
" vimrc
nmap <Leader>ve :split $MYVIMRC<CR>
nmap <Leader>vs :so $MYVIMRC<CR>
" plugins.vim
nmap <Leader>pe :exe 'split '.$MYPLUGINS<CR>


" ===================== SAVE/RESTORE SESSION =====================
" under development
"function! SaveSession()
"  execute 'mksession! ~/.vim/session.vim'
"endfunction

"if filereadable('~/.vim/session.vim')
"  execute 'so ~/.vim/session.vim'
"endif

"function! RestoreSession()
  "if filereadable('~/.vim/session.vim')
    "execute 'so ~/.vim/session.vim'
    "if bufexists(1)
      "for l in range(1, bufnr('$'))
        "if bufwinnr(l) == -1
          "execute 'sbuffer ' . l
        "endif
      "endfor
    "endif
  "endif
"endfunction

"autocmd! VimLeave * call SaveSession()
"autocmd! VimEnter * call RestoreSession()
