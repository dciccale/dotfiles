" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

au! BufWritePost plugins.vim so %

" Vundle
Plugin 'gmarik/Vundle.vim'

" COLORSCHEMES {{{
" ==================================================

" my custom molokai theme (denkai)
Plugin 'dciccale/denkai.vim'

" badwolf colorscheme
" Plugin 'sjl/badwolf'

" lucius colorscheme
Plugin 'jonathanfilip/vim-lucius'

" }}}


" EDITOR {{{
" ==================================================

" better powerline
Plugin 'bling/vim-airline'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" delimitMate
Plugin 'Raimondi/delimitMate'

" guizoom (easy increase/decrease vim font size)
Plugin 'dciccale/guizoom.vim'

" matchit (extended % matching)
Plugin 'matchit.zip'

" supertab
Plugin 'ervandew/supertab'

" see vim's undo branches
Plugin 'mbbill/undotree'

" commenting
Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-surround'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
"Plugin "honza/vim-snippets'

" Easy rename current file
Plugin 'Rename2'

" Amazing motion plugin
Plugin 'Lokaltog/vim-easymotion'

" }}}


" SYNTAX {{{
" ==================================================

" better javascript syntax
Plugin 'JavaScript-syntax'
"Plugin 'pangloss/vim-javascript'
"Plugin 'jelera/vim-javascript-syntax'

" AutoCloseTag (ypid version has some fixes)
Plugin 'ypid/HTML-AutoCloseTag'

" Jade syntax highlight
Plugin 'digitaltoad/vim-jade'

" Stylus syntax highlight
Plugin 'wavded/vim-stylus'

" less syntax highlight
Plugin 'lunaru/vim-less'

" underscore template syntax highlight
Plugin 'aaronj1335/underscore-templates.vim'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Nice css3 highlight suppot (Broken since vim 7.4)
" Plugin 'lepture/vim-css'
Plugin 'hail2u/vim-css3-syntax'

" SASS
Plugin 'cakebaker/scss-syntax.vim'

" }}}


" SCM {{{
" ==================================================

" Shows git diff in the gutter
Plugin 'airblade/vim-gitgutter'

" }}}

call vundle#end()
