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
Plugin 'sjl/badwolf'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'whatyouhide/vim-gotham'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}

" }}}
"


" EDITOR {{{
" ==================================================

" improve perf when opening big files
Plugin 'vim-scripts/LargeFile'

" jump buffers like chrome tabs
Plugin 'dciccale/vim-chromebuf'

" better powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Easy rename current file
Plugin 'Rename2'

" Amazing motion plugin
" Plugin 'Lokaltog/vim-easymotion'

" }}}


" SYNTAX {{{
" ==================================================

" Plugin 'mxw/vim-jsx'
" let g:jsx_ext_required = 0

" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'

" Plugin 'scrooloose/syntastic'

" Plugin 'leafgarland/typescript-vim'

Plugin 'elmcast/elm-vim'

" Plugin 'elixir-lang/vim-elixir'

" Plugin 'elzr/vim-json'

" Plugin 'othree/yajs.vim'

" Plugin 'JavaScript-syntax'

"Plugin 'jelera/vim-javascript-syntax'

" AutoCloseTag (ypid version has some fixes)
" Plugin 'ypid/HTML-AutoCloseTag'

" Jade syntax highlight
" Plugin 'digitaltoad/vim-jade'

" less syntax highlight
" Plugin 'lunaru/vim-less'

" underscore template syntax highlight
" Plugin 'aaronj1335/underscore-templates.vim'

" CoffeeScript
" Plugin 'kchmck/vim-coffee-script'

" C++
" Plugin 'octol/vim-cpp-enhanced-highlight'

" Nice css3 highlight suppot (Broken since vim 7.4)
" Plugin 'lepture/vim-css'
" Plugin 'hail2u/vim-css3-syntax'

" SASS
" Plugin 'cakebaker/scss-syntax.vim'

" GO
" Plugin 'fatih/vim-go'

" Stylus
" Plugin 'wavded/vim-stylus'

" Swift
" Plugin 'toyamarinyon/vim-swift'

" YAML
" Plugin 'stephpy/vim-yaml'

" PHP
Plugin 'StanAngeloff/php.vim'

" Dockerfile
" Plugin 'ekalinin/Dockerfile.vim'

" nginx
" Plugin 'evanmiller/nginx-vim-syntax'

" }}}


" SCM {{{
" ==================================================

" Shows git diff in the gutter
Plugin 'airblade/vim-gitgutter'

" }}}

call vundle#end()
