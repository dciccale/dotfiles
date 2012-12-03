filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle handle vundle
Bundle 'gmarik/vundle'

""" PLUGINS

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

augroup coffee
  " CoffeeLint before compiling
  au BufWritePre *.coffee silent CoffeeLint! | cwindow | redraw!
  " auto-compile on save
  "au BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!
  " fold by indentation in .coffee files
  au BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent nofoldenable
augroup END


" CommandT
Bundle 'git://git.wincent.com/command-t.git'
" show window at top
let g:CommandTMatchWindowAtTop = 1
" show few lines, is fuzzy search no need to read all
let g:CommandTMaxHeight = 10

" Snippets
Bundle 'msanders/snipmate.vim'

Bundle 'wavded/vim-stylus'
Bundle 'tomasr/molokai'
Bundle 'digitaltoad/vim-jade'

filetype plugin indent on
