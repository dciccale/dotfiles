call plug#begin('~/.config/nvim/plugins')

au! BufWritePost plugins.vim so %

" COLORSCHEMES {{{
" ==================================================

Plug 'jonathanfilip/vim-lucius'
Plug 'dciccale/vim-space'
Plug 'dracula/vim'

" }}}


" EDITOR {{{
" ==================================================

" Copilot
Plug 'github/copilot.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" minimap
Plug 'wfxr/minimap.vim'
let g:minimap_highlight_search = 1

" extendable fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" switch buffers like firefox tabs
Plug 'dciccale/vim-chromebuf'

" better powerline
Plug 'bling/vim-airline'

" multiple cursors (disabled for nvim)
Plug 'terryma/vim-multiple-cursors'

" delimitMate (disabled for nvim)
Plug 'Raimondi/delimitMate'

" guizoom (easy increase/decrease vim font size)
" Plug 'dciccale/guizoom.vim'

" matchit (extended % matching)
" Plug 'vim-scripts/matchit.zip'

Plug 'andymass/vim-matchup'
:hi MatchWord ctermfg=blue ctermbg=none guifg=blue cterm=underline gui=underline
:hi MatchParen ctermfg=blue ctermbg=none guifg=blue cterm=underline gui=underline


" supertab (disabled for nvim)
" Plug 'ervandew/supertab'

" see vim's undo branches
Plug 'mbbill/undotree'

" commenting
Plug 'tomtom/tcomment_vim'

" SnipMate (disabled for nvim)
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" let g:snipMate = { 'snippet_version' : 1 }

" Easy rename current file
Plug 'vim-scripts/Rename2'

" Plug 'gpanders/editorconfig.nvim'

" Plug 'stephpy/vim-php-cs-fixer'
" let g:php_cs_fixer_php_path = "docker-compose run --rm php"
" let g:php_cs_fixer_path = "/Users/denis/git/kiwin/kiwinio/src/vendor/bin/php-cs-fixer"

" YCM
" Plug 'Valloric/YouCompleteMe'

" }}}

" SYNTAX {{{
" ==================================================

" Plug 'fatih/vim-go'
" Plug 'leafgarland/typescript-vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript'
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'npm install',
"   \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html'] }

" }}}


" SCM {{{
" ==================================================

" Shows git diff in the gutter
Plug 'airblade/vim-gitgutter'

" }}}

call plug#end()
