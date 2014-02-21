" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

au! BufWritePost plugins.vim so ~/.vim/plugins.vim

" Vundle
Bundle 'gmarik/vundle'

" COLORSCHEMES {{{
" ==================================================

" my custom molokai theme (denkai)
Bundle 'dciccale/denkai.vim'

" badwolf colorscheme
Bundle 'sjl/badwolf'

" lucius colorscheme
Bundle 'jonathanfilip/lucius'

" }}}


" EDITOR {{{
" ==================================================

" better powerline
Bundle 'bling/vim-airline'

" multiple cursors
Bundle 'terryma/vim-multiple-cursors'

" delimitMate
Bundle 'Raimondi/delimitMate'

" guizoom (easy increase/decrease vim font size)
Bundle 'dciccale/guizoom.vim'

" matchit (extended % matching)
Bundle 'matchit.zip'

" supertab
Bundle 'ervandew/supertab'

" see vim's undo branches
Bundle 'mbbill/undotree'

" commenting
Bundle 'tomtom/tcomment_vim'

Bundle 'tpope/vim-surround'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
"Bundle "honza/vim-snippets"

" Easy rename current file
Bundle 'Rename2'

" Amazing motion plugin
Bundle 'Lokaltog/vim-easymotion'

" }}}


" SYNTAX {{{
" ==================================================

" better javascript syntax
Bundle 'JavaScript-syntax'
"Bundle 'pangloss/vim-javascript'
"Bundle 'jelera/vim-javascript-syntax'

" AutoCloseTag (need fixes)
Bundle 'HTML-AutoCloseTag'

" Jade syntax highlight
Bundle 'digitaltoad/vim-jade'

" Stylus syntax highlight
Bundle 'wavded/vim-stylus'

" less syntax highlight
Bundle 'lunaru/vim-less'

" underscore template syntax highlight
Bundle 'aaronj1335/underscore-templates.vim'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" C++
Bundle 'octol/vim-cpp-enhanced-highlight'

" BROKEN SINCE VIM 7.4
" Nice css3 highlight suppot
" Bundle 'lepture/vim-css'
Bundle 'hail2u/vim-css3-syntax'

" SASS
Bundle 'cakebaker/scss-syntax.vim'

" }}}


" SCM {{{
" ==================================================

" Shows git diff in the gutter
Bundle 'airblade/vim-gitgutter'

" }}}
