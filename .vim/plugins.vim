call plug#begin('~/.vim/plugins')

au! BufWritePost plugins.vim so %

" COLORSCHEMES {{{
" ==================================================

" Plug 'jonathanfilip/vim-lucius'
Plug 'dciccale/vim-space'
" Plug 'dracula/vim'

" }}}


" EDITOR {{{
" ==================================================

" switch buffers like firefox tabs
Plug 'dciccale/vim-chromebuf'

" better powerline
Plug 'bling/vim-airline'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" delimitMate
Plug 'Raimondi/delimitMate'

" guizoom (easy increase/decrease vim font size)
Plug 'dciccale/guizoom.vim'

" matchit (extended % matching)
Plug 'vim-scripts/matchit.zip'

" supertab
Plug 'ervandew/supertab'

" see vim's undo branches
Plug 'mbbill/undotree'

" commenting
Plug 'tomtom/tcomment_vim'

" SnipMate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Easy rename current file
Plug 'vim-scripts/Rename2'

" YCM
" Plug 'Valloric/YouCompleteMe'

" }}}

" SYNTAX {{{
" ==================================================

Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html'] }

" Plug 'vim-scripts/indentpython.vim'
" }}}


" SCM {{{
" ==================================================

" Shows git diff in the gutter
Plug 'airblade/vim-gitgutter'

" }}}

call plug#end()
