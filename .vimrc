" no vi compatibility
set nocp


" ===================== PLUGINS =====================

" my plugins config file path
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS



" ===================== GVIMRC =====================

" define gvimrc here
if has('gui_running')
  if has('mac')
    set guifont=Monaco:h12
  else
    set guifont=Courier_New:h10:cANSI
  endif
endif



" ===================== EDITION =====================

" basic edition stuff on
syntax on
filetype on
filetype plugin on
filetype indent on

" use unix as standard file type
set fileformats=unix,dos,mac

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

" color trailing whitespace
highlight TrailWhitespace ctermbg=red guibg=#f62c73
match TrailWhitespace /\s\+$\| \+\ze\t/

" autocomplete using tab
inoremap <expr> <Tab> strpart(getline('.'), col('.') - 2, 1) =~ '\w' ? "\<C-P>" : "\<Tab>"

" switch between last two files
nnoremap <leader><leader> <c-^>

" use many undos
set undolevels=1000

" do not syntax highlight too long lines
set synmaxcol=800

" keep selection to indent/outdent
vnoremap < <gv
vnoremap > >gv

" move the cursor when insert mode
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

" select all
map <leader>a ggVG

" enter key goes to error in quickfix window
au BufWinEnter quickfix nmap <buffer> <Enter> :.cc<CR>

" join lines with cursor staying in place
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<CR>



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
map <leader>bd :bd<CR>

" quick save
map <leader>w :w<CR>

" force save
com! W :w !sudo tee %
map <leader>W :W<CR>

" quick source current file
map <leader>s :so %<CR>

" make j/k move to next visual line instead of pysical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" easy move lines in all modes
imap <A-j> <ESC>mz:m+<CR>`zi
imap <A-k> <ESC>mz:m-2<CR>`zi
nmap <A-j> mz:m+<CR>`z
nmap <A-k> mz:m-2<CR>`z
vmap <A-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<CR>`>my`<mzgv`yo`z

" remap Alt key in Mac (don't use macmeta)
if has('mac') || has('macunix')
  imap <D-j> <A-j>
  imap <D-k> <A-k>
  nmap <D-j> <A-j>
  nmap <D-k> <A-k>
  vmap <D-j> <A-j>
  vmap <D-k> <A-k>
endif

" easy add new line in normal mode
nnoremap <CR> o<ESC>k

" easy remove line in normal mode
" (copy to _ for not loosing the last register)
nnoremap <BS> "_dd

" easy empty line without going insert mode
nnoremap <leader>D 0D<ESC>

" easey copy/paste from/to system clipboard
map <leader>yy "*y
map <leader>pp "*p
map <leader>YY "*Y
map <leader>PP "*P



" ===================== SPLITS =====================

" always do vertical splits at right side
set splitright

" always do horizontal splits below
set splitbelow

" reize splits on window resize
au VimResized * exe "normal! \<c-w>="

" only have cursorline in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

" Max/unmax splits
nnoremap <C-w>o :call MaximizeToggle()<cr>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction



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
nnoremap <leader>0 :nohls<CR>

" don't move on *
nnoremap * *<C-o>

" center search
nmap n nzz
nmap N Nzz

" do not highlight when vim starts
nohls



" ===================== TERMINAL =====================

" limit textwidth
set textwidth=120

" wider number width
set numberwidth=6

" highlight column at 120 chars
set colorcolumn=120

" disable blinking cursor
set guicursor=a:blinkon0

" always show status bar
set laststatus=2

" my status line
set statusline=\ #%n\ %F
set statusline+=\ %m
set statusline+=\ %r
set statusline+=Line\ %l\ %P
set statusline+=\ \ Column\ %c
set statusline+=%=
set statusline+=\ [%{&ff}]
set statusline+=\ %{&ft}

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

" restore messed up vim
map <F5> :redraw!<CR><c-w>=



" ===================== FOLDS =====================

set foldmethod=syntax

" do not fold automatically
set nofoldenable

" toggle folds with space bar
nnoremap <silent> <Space> za



" ===================== NAVIGATION =====================

" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy tab navigation
map <S-l> :tabnext<CR>
map <S-h> :tabprevious<CR>

" buffer navigation with arrow keys
nnoremap <Right> :bnext<CR>
nnoremap <Left>  :bprev<CR>



" ===================== AUTOCOMMANDS =====================

" let vim create a template file based on the file type
autocmd! BufNewFile * silent! 0r $HOME/.vim/template.%:e

" remove unwanted trailling spaces
autocmd! BufWritePre * :%s/\s\+$//e



" ===================== EDIT VIMRC =====================

" vimrc
nmap <leader>ve :split $MYVIMRC<CR>
nmap <leader>vs :so $MYVIMRC<CR>
" plugins.vim
nmap <leader>pe :exe 'split '.$MYPLUGINS<CR>



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
