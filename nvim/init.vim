" PLUGINS {{{
" ==================================================

" my plugins config file path
let $MYPLUGINS='~/.config/nvim/plugins.vim'

" load plugins managed by vundle
exec 'so ' . $MYPLUGINS

" }}}


" EDITION {{{
" ==================================================

set guicursor=""
set background=dark
" color space
color dracula
" colorscheme tokyonight
" color lucius
" color github_*

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
hi TrailWhitespace ctermbg=Red guibg=#F92672
match TrailWhitespace /\s\+$\| \+\ze\t/

" highlight trailing whitespaces
hi WhitespaceEOL ctermbg=Red guibg=#F92672
match WhitespaceEOL /\s\+$/

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

" return to the same line when you reopen a file
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exec 'normal! g`"zvzz' |
      \ endif
augroup end

" command to capitalize the first letters of comments starting with //
com! CapitalizeComments :%s/\/\/ \(\w\)\(\w*\)/\/\/ \U\1\L\2/g

" allow autocomplete of dashed words
au! InsertEnter *.styl,*.scss :setl isk+=-

" allow moving between dashed words in normal mode
au! InsertLeave *.styl,*.scss :setl isk-=-

" activate cursor column in jade for helping with indentation
au BufEnter,BufRead,BufNewFile *.jade,*.yml,*.yaml setl cursorcolumn

" allow autocomplete of dashed words
au! BufEnter,BufRead,BufNewFile *.go setl nolist

" allow autocomplete of dashed words
au! BufEnter,BufNewFile,BufRead *.py
    \ setl tabstop=4 |
    \ setl nolist |
    \ setl softtabstop=4 |
    \ setl shiftwidth=4 |
    \ setl noexpandtab |
    \ setl autoindent |
    \ setl fileformat=unix

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

" clear trailing whitespaces
map <leader>cl :%s/\s\+$//e<cr>

" easy :bd
map <silent> <leader>bd :bd<cr>

" quick save
map <leader>w :w<cr>

" quick quit
map <silent> <leader>q :q<cr>

" force quit (kill vim)
" map <silent> <leader>k :qa!<cr>

" select all
nmap <leader>a ggVG

" select full javascript function
" required to be at the same line of the opening symbol (need to improve this)
nmap <leader>sf V$%

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

" leave insert mode and save
inoremap jj <Esc>:w<cr>

" uppercase current word in insert mode
ino <c-u> <esc>mzgUiw`za

" uppercase current visually selected word
vn <c-u> :<c-u>normal! mzgUiw`za<cr>

" lowercase current word in insert mode
ino <c-a> <esc>mzguiw`za

" lowercase current visually selected word
vn <c-a> :<c-u>normal! mzguiw`za<cr>

" turn current visually selected text into kinda stylus
vn <c-s> :s/\%V[:;{}]//g<cr>

" panic!
nn <f9> mzggg?G`z

" retab and reformat
map <leader>rr mz<bar>:retab!<bar>:normal gg=G<cr>`z

" just retab and save
map <leader>rt :retab!<bar>:w<cr>

vn J :m '>+1<cr>gv=gv
vn K :m '<-2<cr>gv=gv

" disable K in normal mode as I type this often and don't use it
" nn K <nop>

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

" get vim help from the text under the cursor
map <leader>h <esc>:help <c-r><c-w><cr>

" map Q to repeat the last recorded macro
map Q @@

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * set number
au InsertLeave * set relativenumber


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

" highlight SCM conflict markers (is giving conflict with the TrailWhitespace)
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\*\)\?$'
" match ErrorMsg '\v^(\<|\=|\>){7}([^=].+)?$'

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

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
" nn <silent> <tab> :nohls<cr>

" don't move on *
" nn * *<c-o>

" search for visually selected text
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" search for selected word with *
vn * :<c-u>call <sid>VSetSearch()<cr>//<cr><c-o>

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
nnoremap <silent> + :normal! mz*<cr><bar>:call <sid>ReplaceHighlightedText()<cr>
    \ <bar>:nohls<cr><bar>:normal! `z<cr>

" mapping to replace visually selected text
vn <silent> + :normal! mz*<cr><bar>:<c-u>call <sid>VSetSearch()<cr>//<cr><c-o>
    \ <bar>:call <sid>ReplaceHighlightedText()<cr><bar>:nohls<cr><bar>:normal! `z<cr>

" center search
nmap n nzz
nmap N Nzz

" }}}


" TERMINAL {{{
" ==================================================

let s:txtwidth=120

" limit textwidth
exec 'set textwidth=' . s:txtwidth

" highlight column limit
exec 'set colorcolumn=' . s:txtwidth

" wider number column
set numberwidth=6

" always show status bar
set laststatus=2

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
set nobackup nowritebackup noswapfile

" always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=80

" shorten vim messages
" see :h shortmess for the breakdown of what this changes
set shortmess=atI

" know highlight group of current word
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" stop annoying noise
set visualbell

" restore messed up vim and splits
map <f5> :syntax sync fromstart<cr>:redraw!<cr><c-w>=

" }}}


" FOLDS {{{
" ==================================================

set foldopen+=jump

" do not fold automatically
set nofoldenable

" from http://vim.wikia.com/wiki/Folding
" toggle folds with space only if inside valid fold method, otherwise use default behaviour
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<cr>

" create custom fold in visual mode when foldmethod=manual or marker
vn <space> zf

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
" map <s-l> :tabnext<cr>
" map <s-h> :tabprevious<cr>

" move the cursor in insert mode
imap <c-h> <c-o>h
imap <c-j> <c-o>j
imap <c-k> <c-o>k
imap <c-l> <c-o>l

" breaks scrolling in nvim
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

" easy buffer navigation
" set <c-s-h>=
" nn <silent> <> :bnext<cr>
" map ^H <c-s-h>
" set <F13>=^[H
" map <F13> <c-s-h>
" map! <F13> <c-s-h>
" nn <c-s-h> :bprev<cr>

nn <silent> <c-l> :bnext<cr>
nn <silent> <c-h> :bprev<cr>

" tests
" nn <silent> <right> :bnext<cr>
" nn <silent> <left> :bprev<cr>
" if in insert mode leave and run normal mapping"
" ino <silent> <right> <esc>:bnext<cr>
" ino <silent> <left> <esc>:bprev<cr>

" }}}


" AUTOCOMMANDS {{{
" ==================================================

" let vim create a template file based on the file type
au! BufNewFile * silent! 0r $HOME/.vim/templates/template.%:e

" .md extension is markdown
au! BufNewFile,BufRead *.md set ft=markdown

" remove unwanted trailling spaces on save
" au! BufWritePre * :%s/\s\+$//e

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

" capitalize first letter
nmap <leader>c mzb~`z


" SPELLING {{{
" ==================================================

" fix my common spelling mistakes
iab slef self
iab tihs this
iab functino function
iab funciton function
iab resovle resolve
iab lgo log
iab getElementByID getElementById
iab siaf iife
iab Promsie Promise
iab retrun return
iab conts const
iab udpate update
iab tempaltes templates
iab onlye only
iab wareohuse warehouse
iab inventoryShpiment inventoryShipment
iab cons const
iab cosnt const
iab witohut without
iab reutrn return
iab josn json
iab metohd method
iab weigth weight
iab tyoe type

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

" }}}


" SNIPPETS CONFIG {{{
" ==================================================

" let g:SuperTabDefaultCompletionType = "<c-n>"

" edit desired snipMate snippets for the specified file type
function! s:EditSnippet()
  call inputsave()
  let l:type = input('Enter snippets lang ')
  call inputrestore()
  if (l:type == 'js')
    let l:type = 'javascript'
  elseif (l:type == 'md')
    let l:type = 'markdown'
  elseif (l:type == 'ts')
    let l:type = 'typescript'
  endif
  if (empty(l:type))
    return
  endif
  " exec ':sp ~/.vim/snippets/' . l:type . '.snippets'
  exec ':sp ~/.config/coc/ultisnips/' . l:type . '.snippets'
endfunction

" fast snippet edit
map <silent> <leader>se :call <sid>EditSnippet()<cr>

" }}}


" UNDOTREE CONFIG {{{
" ==================================================

let g:undotree_SplitWidth = 40
map <leader>u :UndotreeToggle<cr>

" }}}


" PRETTIER CONFIG {{{
" ==================================================

" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat_config_present = 1

" }}}


" COC-PYRIGHT CONFIG {{{
" ==================================================

aug python
  au!
  au BufWrite *.py call CocAction('format')
aug END

" }}}


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

" save last closed buffer
au! BufDelete * let last_buffer = expand('%:p')
map <silent> <leader>bl :exec ':e ' . last_buffer<cr>

let g:go_fmt_command = "goimports"
let g:go_imports_mode = "goimports"
let g:go_auto_type_info = 1
let g:go_updatetime = 400

function! BufList()
  let bufcount = bufnr("$")
  let currbufnr = 1

  if (bufcount > 0)
    echo "\n Enter buffer number\n ________________________________\n\n"
    while currbufnr <= bufcount
      if (bufexists(currbufnr) && buflisted(currbufnr))
        let space = currbufnr > 99 ? " " : currbufnr > 9 ? "  " : "   "
        echo space . currbufnr . "  |  " . fnamemodify(bufname(currbufnr), ':t')
      endif
      let currbufnr = currbufnr + 1
    endwhile
    echo "\n"
  endif

  let desiredbufnr = input("#")
  if (strlen(desiredbufnr) != 0)
    execute ":b ". desiredbufnr
  endif
endfunction

" list all buffers
nmap <c-o> :call BufList()<cr>


" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr, sep = ';')
  let s = a:sep
  if a:colnr > 1
    let n = a:colnr - 1
    echom s
    execute 'match Keyword /^\([^'.s.']*'.s.'\)\{'.n.'}\zs[^'.s.']*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    execute 'match Keyword /^[^'.s.']*/'
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=* Csv :call CSVH(<f-args>)

" PLUGIN MAPPINGS {{{
" ==================================================

" telescope
nnoremap <leader>fd <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coc-snippets
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackSpace() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! CheckBackSpace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'




" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction




:hi! link CocFloating CocHintFloat

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" if exists('*complete_info')
"   inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use <Tab> and <S-Tab> to navigate the completion list:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" }}}


" disable syntax highlighting in big files
"function DisableSyntaxTreesitter()
"    echo("Big file, disabling syntax, treesitter and folding")
"    if exists(':TSBufDisable')
"        exec 'TSBufDisable autotag'
"        exec 'TSBufDisable highlight'
"        " etc...
"    endif
"
"    set foldmethod=manual
"    syntax clear
"    syntax off    " hmmm, which one to use?
"    filetype off
"    set noundofile
"    set noswapfile
"    set noloadplugins
"endfunction
"
"augroup BigFileDisable
"    autocmd!
"    autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 4300 | exec DisableSyntaxTreesitter() | endif
"augroup END

let g:coc_global_extensions = [ 'coc-eslint', 'coc-prettier']

" Go lang
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
