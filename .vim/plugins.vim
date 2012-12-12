" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
augroup coffeescript
  au!
  " CoffeeLint before compiling
  "au BufWritePre *.coffee silent CoffeeLint! | cwindow | redraw!
  "
  " auto-compile on save
  " (disable until come with a way of settin output path)
  " au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
  "
  " fold by indentation in .coffee files
  au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent nofoldenable
augroup END

" CommandT
Bundle 'git://git.wincent.com/command-t.git'
" show window at top
let g:CommandTMatchWindowAtTop = 1
" show few lines, is fuzzy search no need to read all
let g:CommandTMaxHeight = 10
" ctrl+p like sublime
nnoremap <C-p> :CommandT<CR>
" ctrl+b like sublime
nnoremap <C-b> :CommandTBuffer<CR>

" SnipMate
Bundle 'msanders/snipmate.vim'

" Stylus
Bundle 'wavded/vim-stylus'

" Molokai theme
Bundle 'tomasr/molokai'
colorscheme molokai

" Jade
Bundle 'digitaltoad/vim-jade'

" SuperTab
Bundle 'ervandew/supertab'

" Zoom
nmap <Leader>+ :ZoomIn<CR>
nmap <Leader>- :ZoomOut<CR>
nmap <Leader>= :ZoomReset<CR>

" delimitMate
Bundle 'Raimondi/delimitMate'

" AutoCloseTag
Bundle 'HTML-AutoCloseTag'

" matchit (extended % matching)
Bundle 'matchit.zip'
