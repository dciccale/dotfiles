" no vi compatibility
set nocp



" PLUGINS
" ==================================================

" my plugins config file path
let $MYPLUGINS = '~/.vim/plugins.vim'

" load plugins managed by vundle
exe 'so '.$MYPLUGINS



" GVIMRC
" ==================================================

" define gvimrc here
if has('gui_running')
  if has('mac')
    set guifont=Monaco:h12
  else
    set guifont=Courier_New:h10:cANSI
  endif
endif

" disable blinking cursor
set guicursor=a:blinkon0



" EDITION
" ==================================================

color badwolf

" basic edition stuff on
syntax on
filetype on
filetype plugin on
filetype indent on

" time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=10

" return to the same line when you reopen a file
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup end

" use unix as standard file type
set fileformats=unix,dos,mac

" always set autoindenting on
set autoindent

" good when starting a new line
set smartindent

" copy the previous indentation on autoindenting
"set copyindent

" fill tabs with spaces
set expandtab

" 2 spaces everywhere please!
set tabstop=2
set softtabstop=2
set shiftwidth=2

" don't wrap lines
set nowrap

" show line numbers
set number

" highlight current line
set cursorline

" auto load files when changed outside of vim
set autoread

" allow hidden buffers
set hidden

" allow more tabs
set tabpagemax=50

" highlight trailing whitespace (and tabs)
" http://nvie.com/posts/how-i-boosted-my-vim/
set list
set listchars=tab:▸\ ,trail:·

" color trailing whitespace
hi TrailWhitespace ctermbg=198 guibg=#f62c73
match TrailWhitespace /\s\+$\| \+\ze\t/

" use many undos
set undolevels=1000

" do not syntax highlight too long lines
set synmaxcol=500

" keep selection to indent/outdent
vnoremap < <gv
vnoremap > >gv

" easy indent/outdent
nn < <<
nn > >>

" join lines with cursor staying in place
nn J mzJ`z



" SCROLLING
" ==================================================

" show more lines around cursor when at the edge of file
set scrolloff=3
set sidescrolloff=5

" scroll viewport faster
nn <c-e> 5<c-e>
nn <c-y> 5<c-y>
vnoremap <c-e> 5<c-e>
vnoremap <c-y> 5<c-y>

" keep cursor in position when moving around
set nostartofline


" MAPPINGS
" ==================================================

" change the mapleader from \ to ,
let mapleader=","

" - is the new : (i.e. -w to save) faster instead of shift+:
nn - :

" easy :bd
map <silent> <leader>bd :bd<cr>

" delete all buffers
map <silent> <leader>wp :1,9999bwipeout<cr>

" quick save
map <leader>w :w<cr>

" select all
nmap <leader>a ggVG

" force save of files with root permission
com! W :w !sudo tee %
map <leader>W :W<cr>

" maximize vim window
map <leader>m :let &lines=500<bar>let &columns=500<cr>

" minimize vim window
map <leader>n :let &lines=35<bar>let &columns=140<bar>winpos 150 110<cr>

" easy move lines in all modes without losing cursor position
imap <d-j> <esc>mz:m+<cr>`zi
imap <d-k> <esc>mz:m-2<cr>`zi
nmap <d-j> mz:m+<cr>`z
nmap <d-k> mz:m-2<cr>`z
vmap <d-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <d-k> :m'<-2<cr>`>my`<mzgv`yo`z

" easy add new line in normal mode
" without moving the cursor
nn <cr> mzo<esc>`z

" easy remove line in normal mode
" (copy to _ for not losing the last register)
nn <bs> "_dd

" list current dir files and folders
nmap <c-p> :e <c-d>

" list all buffers
nmap <c-o> :ls<cr>:e #

" uppercase current word in insert mode
inoremap <c-u> <esc>mzgUiw`za

" panic!
nn <f9> mzggg?G`z

" retab and reformat
map <leader>r mz<bar>:retab!<bar>:normal gg=G<cr>`z



" VUNDLE MAPPINGS
" ==================================================
map <leader>bi :BundleInstall<cr>
map <leader>bc :BundleClean<cr>
map <leader>bu :BundleUpdate<cr>



" GUIZOOM MAPPINGS
" ==================================================
map <leader>+ :ZoomIn<cr>
map <leader>- :ZoomOut<cr>
map <leader>= :ZoomReset<cr>



" SNIPPETS
" ==================================================

" edit desired snippet of snipMate
function! EditSnippet()
  call inputsave()
  let type = input('Enter snippets lang ')
  call inputrestore()
  if type == 'js'
    let snippetsFile = 'javascript'
  endif
  exe ':e ~/.vim/snippets/' . snippetsFile . '.snippets'
endfunction

" fast snippet edit
map <silent> <leader>se :call EditSnippet()<cr>



" SPLITS
" ==================================================

" always do vertical splits at right side
" and horizontal splits below
set splitright splitbelow

" equally resize splits on window resize
au! VimResized * :wincmd =

" only have cursorline in current window
augroup cline
  au!
  au! WinLeave * set nocursorline
  au! WinEnter * set cursorline
augroup end

" easy close window
map <leader>wc <c-w>c

" move splits around
nn <leader>sl <c-w><s-h>
nn <leader>sr <c-w><s-l>
nn <leader>st <c-w><s-k>
nn <leader>sb <c-w><s-j>

" open all buffers in vertical split
map <silent> <leader>vb :vertical :ball<cr>



" TABS
" ==================================================

" easy open buffer in new tab
map <leader>te :ls<cr>:tabedit #

" easy close tab
map <leader>tc :tabclose<cr>

" open all buffers in tabs
map <silent> <leader>tb :tab :ball<cr>



" SEARCH
" ==================================================

" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" highlight search when typing
set incsearch

" highlight search terms
set hlsearch

" remove highlight when vim starts
nohls

" hide search highlight
nn <silent> <leader>0 :nohls<cr>

" don't move on *
nn * *<c-o>

" center search
nmap n nzz
nmap N Nzz



" TERMINAL
" ==================================================

let s:txtwidth=120

" limit textwidth
exe 'set textwidth=' . s:txtwidth

" highlight column limit
exe 'set colorcolumn=' . s:txtwidth

" wider number column
set numberwidth=6

" always show status bar
set laststatus=2

" my status line
set statusline=\ #%n\ %f\ %m\ %r\ Line\ %l\ %P\ \ Column\ %c%=\ [%{&ff}]\ %{&ft}

" higher command line
set cmdheight=2

" get rid of separation chars
set fillchars=""

" http://items.sjbach.com/319/configuring-vim-right
set wildmenu

" set terminal title
set title

" auto cd to the current buffer directory
set autochdir

" no backup/swap files
set nobackup noswapfile

" shorten vim messages
" see :h shortmess for the breakdown of what this changes
set shortmess=atI

" stop annoying noise
set visualbell

" restore messed up vim and splits
map <f5> :redraw!<cr><c-w>=



" FOLDS
" ==================================================

set foldmethod=syntax

" do not fold automatically
set nofoldenable

" toggle folds with space bar
nn <silent> <space> za

" allow syntax foldmethod for javascript
let javaScript_fold=1



" NAVIGATION
" ==================================================

" make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nn k gk
nn j gj
nn gk k
nn gj j

" easy window navigation
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easy tab navigation
map <s-l> :tabnext<cr>
map <s-h> :tabprevious<cr>

" move the cursor in insert mode
imap <c-h> <c-o>h
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l

" easy buffer navigation with arrow keys
nn <right> :bnext<cr>
nn <left> :bprev<cr>



" AUTOCOMMANDS
" ==================================================

" set this when coffeescript
au! BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" let vim create a template file based on the file type
au! BufNewFile * silent! 0r $HOME/.vim/templates/template.%:e

" remove unwanted trailling spaces on save
au! BufWritePre * :%s/\s\+$//e

" set current path to current file parent directory for better use of :find
au! BufEnter * silent! let &path = expand('%:p:h') . '/**'

" enter key goes to error in quickfix window (CoffeeLint fix)
au! BufWinEnter quickfix nmap <buffer> <enter> :.cc<cr>



" EDIT/SOURCE VIMRC/PLUGINS
" ==================================================

" easy edit

" vimrc
nmap <leader>ve :split $MYVIMRC<cr>
nmap <leader>vs :so $MYVIMRC<cr>

" plugins.vim
nmap <leader>pe :exe 'split '.$MYPLUGINS<cr>



" PROJECTS
" ==================================================

" load projects configs
so ~/.vim/projects.vim



" SPELLING
" ==================================================

" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById



" REGISTERS
" ==================================================

" may be I will do this and keep only one register (system clipboard)
" anyway I can't keep track of more than two..
" http://stackoverflow.com/a/1290230/194630
"noremap y "*y
"noremap Y "*Y
"noremap p "*p
"noremap P "*P
"vnoremap y "*y
"vnoremap Y "*Y
"vnoremap p "*p
"vnoremap P "*P
