" no vi compatibility
set nocp


" PLUGINS {{{
" ==================================================

" my plugins config file path
let $MYPLUGINS='~/.vim/plugins.vim'

" load plugins managed by vundle
exec 'so ' . $MYPLUGINS

" }}}


" GVIMRC {{{
" ==================================================

" define gvimrc here
if has('gui_running')
  if has('mac')
    set guifont=Monaco:h12
  else
    set guifont=Courier_New:h10:cANSI
  endif

  set guiheadroom=0

  " disable blinking cursor
  set guicursor+=a:blinkon0
endif

" }}}


" EDITION {{{
" ==================================================

" color lucius
" set background=light
color denkai
set background=dark
let g:badwolf_html_link_underline = 0
let g:badwolf_css_props_highlight = 1

" basic edition stuff on
filetype on
syntax on
filetype plugin indent on

" use unix as standard file type
set fileformats=unix,dos,mac

" always set autoindenting on
set autoindent

" good when starting a new line
set smartindent

" copy the previous indentation on autoindenting
set copyindent

" fill tabs with spaces
set expandtab

" 2 spaces everywhere please!
let g:tabwidth=2
exec 'set tabstop=' . g:tabwidth
exec 'set shiftwidth=' . g:tabwidth
exec 'set softtabstop=' . g:tabwidth

" don't wrap lines
set nowrap

" show relative line numbers (but show the real line number for the line where the cursor is)
set number
set relativenumber

" highlight current line
set cursorline

" auto load files when changed outside of vim
set autoread

" allow hidden buffers
set hidden

" allow more tabs
set tabpagemax=30

" always show number of changed lines
set report=0

set noshowmode

syntax on

" always show auto complete popup
set completeopt=menu,preview
set pumheight=5

set formatoptions+=tn1

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
set synmaxcol=300

" keep selection to indent/outdent
vn < <gv
vn > >gv

" easy indent/outdent
nn < <<
nn > >>

" join lines with cursor staying in place
nn J mzJ`z

" function! s:RunCodeHelper(property)
"   :exec "normal! $a,\<CR>'\|i"
"   " :exec "normal! i\\t"
"   " :exec "normal! a"
" endfunction
" nn <silent> zyp :call RunCodeHelper('property')<cr>

" return to the same line when you reopen a file
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exec 'normal! g`"zvzz' |
      \ endif
augroup end

au BufRead,BufNewFile *.tpl set ft=underscore_template
au BufRead,BufNewFile *.dot,*.def set ft=dot

" command to capitalize the first letters of comments starting with //
com! CapitalizeComments :%s/\/\/ \(\w\)\(\w*\)/\/\/ \U\1\L\2/g

" allow autocomplete of dashed words
au! InsertEnter *.styl,*.scss :setl isk+=-

" allow moving between dashed words in normal mode
au! InsertLeave *.styl,*.scss :setl isk-=-

" activate cursor column in jade for helping with indentation
au BufEnter,BufRead,BufNewFile *.jade setl cursorcolumn

" }}}


" SCROLLING {{{
" ==================================================

" show more lines around cursor when at the edge of file
set scrolloff=3
set sidescrolloff=5

" scroll viewport faster
nn <c-e> 5<c-e>
nn <c-y> 5<c-y>
vn <c-e> 5<c-e>
vn <c-y> 5<c-y>

" keep cursor in position when moving around
set nostartofline

" }}}


" MAPPINGS {{{
" ==================================================

" change the mapleader from \ to ,
let mapleader=","
let maplocalleader = "\\"

" - is the new : (i.e. -w to save) faster instead of shift+:
nn - :

" easy :bd
map <silent> <leader>bd :bd<cr>

" save session
map <silent> <leader>ss :mksession! ~/.vim/session.vim<cr>
map <silent> <leader>ls :so ~/.vim/session.vim<cr>

" delete all buffers
map <silent> <leader>wp :1,9999bwipeout<cr>

" quick save
map <leader>w :w<cr>

" quick quit
map <silent> <leader>q :q<cr>

" force quit (kill vim)
map <silent> <leader>k :qa!<cr>

" select all
nmap <leader>a ggVG

" select full javascript function
" (or anything that matchi % can handle)
" required to be at the same line of the openin symbol (need to improve this)
nmap <leader>sf V$%
" select the content inside a function
nmap <leader>sc [zjV]zk

" force save of files with root permission
com! W :w !sudo tee % > /dev/null
map <silent> <leader>W :W<cr>

" maximize vim window
map <leader>m :let &lines=500<bar>let &columns=500<cr>

" minimize vim window
map <leader>n :let &lines=35<bar>let &columns=140<bar>winpos 150 110<cr>

" easy move lines in all modes without losing cursor position
imap <silent> <d-j> <esc>mz:m+<cr>`zi
imap <silent> <d-k> <esc>mz:m-2<cr>`zi
nmap <silent> <d-j> mz:m+<cr>`z
nmap <silent> <d-k> mz:m-2<cr>`z
vmap <silent> <d-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <d-k> :m'<-2<cr>`>my`<mzgv`yo`z

" easy add new line in normal mode
" without moving the cursor
nn <cr> mzo<esc>`z

" easy remove line in normal mode
" (copy to _ for not losing the last register)
nn <bs> "_dd

" easy ctrl p, list current dir files and folders
nmap <c-p> :e <c-d>

" navigate explorer
noremap <silent> <leader>e :Vexplore<cr>

" thanks julien!
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_dirhistmax=0
let g:netrw_keepdir=0
let g:netrw_winsize=30
let g:netrw_list_hide='\.DS_Store$,\.git$'
let g:netrw_chgwin=winnr()
" see file explorer in tree style
let g:netrw_liststyle=3
let g:netrw_fastbrowse=2

" list to open in new tab
nmap <c-t> :tabedit <c-d>

" leave insert mode and save
inoremap jj <Esc>:w<cr>

" list all buffers
" nmap <c-o> :ls<cr>:e #
nmap <c-o> :call BufSel()<cr>

" uppercase current word in insert mode
ino <c-u> <esc>mzgUiw`za

" uppercase current visually selected word
vn <c-u> :<c-u>normal! mzgUiw`za<cr>

" turn current visually selected text into kinda stylus
vn <c-s> :s/\%V[:;{}]//g<cr>

" lowercase current word in insert mode
ino <c-a> <esc>mzguiw`za

" lowercase current visually selected word
vn <c-u> :<c-u>normal! mzgUiw`za<cr>

" panic!
nn <f9> mzggg?G`z

" retab and reformat
map <leader>rr mz<bar>:retab!<bar>:normal gg=G<cr>`z

" just retab and save
map <leader>rt :retab!<bar>:w<cr>

" disable K in normal mode as I type this often and don't use it
nn K <nop>

" open current url with default browser
function! s:Open()
  let l:line = getline('.')
  let l:uri = matchstr(l:line, '[a-z]*:\/\/[^ >,;]*')
  if empty(l:uri)
    let l:uri = expand('%')
  endif
  silent exec "!open '" . l:uri . "'"
endfunction

" open URL under cursor or current file in default OS app
map <silent> <leader>o :call <SID>Open()<cr>

" get vim help from for the text under the cursor
map <leader>h <esc>:help <c-r><c-w><cr>

" map Q to repeat the last recorded macro
map Q @@

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * set number
au InsertLeave * set relativenumber

" select inside opening bracket
map <leader>´ vi{

" indent when paste (http://vim.wikia.com/wiki/Format_pasted_text_automatically)
" nnoremap p p=`]

" }}}


" SPLITS {{{
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

" highlight SCM conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\*\)\?$'

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

" easy close window
map <leader>wc <c-w>c

" move splits around
nn <leader>sl <c-w><s-h>
nn <leader>sr <c-w><s-l>
nn <leader>st <c-w><s-k>
nn <leader>sb <c-w><s-j>

" open all buffers in vertical split
map <silent> <leader>vb :vertical :ball<cr>

" open existing buffer to the right of the current one
map <leader>so :ls<cr>:vert sp #

" }}}


" TABS {{{
" ==================================================

" all tabs to buffers
map <silent> <leader>to :tabo<cr>

" easy close tab
map <silent> <leader>tc :tabclose<cr>

" move tab
map <silent> <leader>tm :tabmove<cr>

" open all buffers in tabs
map <silent> <leader>tb :tab :ball<cr>

" }}}


" SEARCH {{{
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
nn <silent> <esc> :nohls<cr>

" don't move on *
nn * *<c-o>

" search for visually selected text
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" search for selected word with *
vn * :<c-u>call <SID>VSetSearch()<cr>//<cr><c-o>

" do a global replace for the word under the cursor in the current buffer
" an input will be prompted
function! s:ReplaceHighlightedText()
  call inputsave()
  let l:replaceWith = input('Replace with: ')
  call inputrestore()
  if (empty(l:replaceWith))
    return
  endif
  exec ":%s//" . l:replaceWith . "/gI"
endfunction

" use the + sign in normal mode to replace word under the cursor
" highlight what will be replaced
nnoremap <silent> + :normal! mz*<cr><bar>:call <SID>ReplaceHighlightedText()<cr>
    \ <bar>:nohls<cr><bar>:normal! `z<cr>

" mapping to replace visually selected text
vn <silent> + :normal! mz*<cr><bar>:<c-u>call <SID>VSetSearch()<cr>//<cr><c-o>
    \ <bar>:call <SID>ReplaceHighlightedText()<cr><bar>:nohls<cr><bar>:normal! `z<cr>

" center search
nmap n nzz
nmap N Nzz

" }}}


" TERMINAL {{{
" ==================================================

let s:txtwidth=100

" limit textwidth
exec 'set textwidth=' . s:txtwidth

" highlight column limit
exec 'set colorcolumn=' . s:txtwidth

" wider number column
set numberwidth=6

" always show status bar
set laststatus=2

" my status line (using airline now)
"set statusline=\ #%n\ %f\ %m\ %r\ Line\ %l\ %P\ \ Column\ %c%=\ [%{&ff}]\ %{&ft}

" higher command line
set cmdheight=2

" get rid of separation chars
set fillchars=""

" http://items.sjbach.com/319/configuring-vim-right
set wildignore=.git,*.pyc,.DS_Store,*.log
set wildmenu
set wildmode=longest,list,full
set infercase

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
map <f5> :syntax sync fromstart<cr>:redraw!<cr><c-w>=

" }}}


" FOLDS {{{
" ==================================================

set foldopen+=jump

augroup ft_javascript
  au!
  au FileType javascript setl foldmethod=marker
  au FileType javascript setl foldmarker={,}
augroup END

augroup ft_html
  au!
  au FileType html setl foldmethod=syntax
augroup END

augroup ft_vim
  au!
  au FileType vim setl foldmethod=marker
augroup END

" do not fold automatically
"set nofoldenable

" from http://vim.wikia.com/wiki/Folding
" toggle folds with space only if inside valid fold method, otherwise use default behaviour
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<cr>
" create custom fold in visual mode when foldmethod=manual or marker
vn <Space> zf

" fold everything except the current fold
nnoremap <leader>z zMzvzz

" }}}


" NAVIGATION {{{
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
nn <silent> <right> :bnext<cr>
nn <silent> <left> :bprev<cr>

" if in insert mode leavte and run normal mapping"
ino <silent> <right> <esc><left>:bnext<cr>
ino <silent> <left> <esc><right>:bprev<cr>

" }}}


" AUTOCOMMANDS {{{
" ==================================================

" set this when coffeescript
au! BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" let vim create a template file based on the file type
au! BufNewFile * silent! 0r $HOME/.vim/templates/template.%:e

" .md extension is markdown
au! BufNewFile,BufRead *.md set ft=markdown

" remove unwanted trailling spaces on save
au! BufWritePre * :%s/\s\+$//e

" set current path to current file parent directory for better use of :find
au! BufEnter * silent! let &path = expand('%:p:h') . '/**'

" }}}


" EDIT/SOURCE VIMRC/PLUGINS {{{
" ==================================================

" for coloring an OK in green
highlight OK guifg=#aeee00

" vimrc
nmap <leader>ve :split $MYVIMRC<cr>
nmap <leader>vs :so $MYVIMRC<cr><bar>:echohl OK<bar>:echo ".vimrc sourced!"<bar>:echohl None<cr>

" plugins.vim
nmap <leader>pe :split $MYPLUGINS<cr>
nmap <leader>c mzb~`z
com! W :w !sudo tee % > /dev/null

" au! BufWritePre $MYPLUGINS :exe 'so ' . $MYPLUGINS<cr><bar>:echo "asd"<cr>

" }}}


" EDIT/SOURCE VIMRC/PLUGINS {{{
" ==================================================

" edit my .bashrc
nmap <leader>be :split $MYBASHRC<cr>

" edit my .aliases
nmap <leader>ae :split $MYALIASES<cr>

" }}}


" PROJECTS {{{
" ==================================================

" load projects configs
let $MYPROJECTS=$HOME . '/.vim/projects.vim'
if filereadable($MYPROJECTS)
  exec 'so ' . $MYPROJECTS
endif

" }}}


" SPELLING {{{
" ==================================================

" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab getElementByID getElementById
iab siaf iife

" }}}


" VUNDLE MAPPINGS {{{
" ==================================================

map <leader>bi :BundleInstall<cr>
map <leader>bc :BundleClean<cr>
map <leader>bu :BundleUpdate<cr>

" }}}


" GUIZOOM MAPPINGS {{{
" ==================================================

map <leader>+ :ZoomIn<cr>
map <leader>- :ZoomOut<cr>
map <leader>= :ZoomReset<cr>

" }}}


" AIRLINE CONFIG {{{
" ==================================================

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline#extensions#tabline#fnamemod=':t'

" }}}


" GIT GUTTER CONFIG {{{
" ==================================================

let g:gitgutter_all_on_focusgained = 0

" refresh gitgutter
map <silent> <leader>rg :call GitGutterToggle()<bar>:call GitGutterToggle()<cr>

" }}}

" SNIPPETS CONFIG {{{
" ==================================================

let g:SuperTabDefaultCompletionType = "<c-n>"

" edit desired snipMate snippets for the specified file type
function! s:EditSnippet()
  call inputsave()
  let l:type = input('Enter snippets lang ')
  call inputrestore()
  if (l:type == 'js')
    let l:type = 'javascript'
  elseif (l:type == 'md')
    let l:type = 'markdown'
  endif
  if (empty(l:type))
    return
  endif
  exec ':sp ~/.vim/snippets/' . l:type . '.snippets'
endfunction

" fast snippet edit
map <silent> <leader>se :call <SID>EditSnippet()<cr>

" }}}


" UNDOTREE CONFIG {{{
" ==================================================

let g:undotree_SplitWidth = 40
map <leader>u :UndotreeToggle<cr>

" }}}

" VIM-JSON
" ==================================================
"
let g:vim_json_syntax_conceal = 0

" MISC STUFF {{{
" ==================================================

" Sum all numbers displayed in each line in a file
function! s:Total()
  let g:S=0
  :%s/[+-]\d\+/\=Sum(submatch(0))/
  echo g:S
endfunction

function! s:Sum(number)
  let g:S = g:S + eval(a:number)
  return a:number
endfunction

" highlight trailing whitespaces
highlight WhitespaceEOL ctermbg=Red guibg=#F92672
match WhitespaceEOL /\s\+$/

" save last closed buffer
au! BufDelete * let last_buffer = expand('%:p')
map <silent> <leader>bl :exec ':e ' . last_buffer<cr>

let g:go_fmt_command = "goimports"

function! BufSel()
  let bufcount = bufnr("$")
  let currbufnr = 1
  let firstmatchingbufnr = 0
  if (bufcount > 0)
    echo " Select buffer\r\n -------------"
    while currbufnr <= bufcount
      if(bufexists(currbufnr) && buflisted(currbufnr))
        let space = currbufnr > 9 ? "" : " "
        echo " " . space . currbufnr . " |  ". fnamemodify(bufname(currbufnr), ':t')
        let firstmatchingbufnr = currbufnr
      endif
      let currbufnr = currbufnr + 1
    endwhile
    echo "\r\n"
  endif
    let desiredbufnr = input("#")
    if(strlen(desiredbufnr) != 0)
      execute ":b ". desiredbufnr
    endif
endfunction

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let syntastic_mode_map = {'passive_filetypes': ['html']}

highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownH3 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Delimiter
