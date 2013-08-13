" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'



" EDITOR
" ==================================================

" fuck yeah
Bundle 'terryma/vim-multiple-cursors'

" better powerline
Bundle 'bling/vim-airline'

" SnipMate
" dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
" actual plugin
Bundle "garbas/vim-snipmate"

" delimitMate
Bundle 'Raimondi/delimitMate'

" guizoom (easy increase/decrease vim font size)
Bundle 'dciccale/guizoom.vim'

" matchit (extended % matching)
Bundle 'matchit.zip'

" supertab
Bundle 'ervandew/supertab'



" COLORSCHEMES
" ==================================================

" my custom molokai theme (denkai)
Bundle 'dciccale/denkai.vim'

" testing badwold colorscheme
Bundle 'sjl/badwolf'



" SYNTAX
" ==================================================

" better javascript syntax
Bundle 'JavaScript-syntax'

" AutoCloseTag (need fixes)
Bundle 'HTML-AutoCloseTag'

" Jade (doesn't work very well)
Bundle 'digitaltoad/vim-jade'

" Better CSS highlight
Bundle 'Better-CSS-Syntax-for-Vim'

" Stylus syntax highlight (doesn't work very well)
Bundle 'wavded/vim-stylus'

" less syntax highlight
Bundle 'lunaru/vim-less'

" underscore template syntax highlight
Bundle 'aaronj1335/underscore-templates.vim'

" loom sdk
Bundle 'netmute/vim-loomscript'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'



" CVS
" ==================================================

" Shows git diff in the gutter
Bundle 'airblade/vim-gitgutter'
