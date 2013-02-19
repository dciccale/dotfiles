" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" my custom molokai theme (denkai)
Bundle 'dciccale/denkai.vim'

" SnipMate
Bundle 'msanders/snipmate.vim'

" delimitMate
Bundle 'Raimondi/delimitMate'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" guizoom (easy increase/decrease vim font size)
Bundle 'dciccale/guizoom.vim'

" matchit (extended % matching)
Bundle 'matchit.zip'

" supertab
Bundle 'ervandew/supertab'

" better javascript syntax
Bundle 'JavaScript-syntax'

" AutoCloseTag (need lots of fixes)
Bundle 'HTML-AutoCloseTag'

" Jade (doesn't work very well)
Bundle 'digitaltoad/vim-jade'

" Better CSS highlight
Bundle 'Better-CSS-Syntax-for-Vim'

" Stylus syntax highlight (doesn't work very well)
Bundle 'wavded/vim-stylus'
