call plug#begin('~/.config/nvim/plugins')

au! BufWritePost plugins.vim so %

" COLORSCHEMES {{{
" ==================================================

" Plug 'jonathanfilip/vim-lucius'
Plug 'dciccale/vim-space'
" Plug 'dracula/vim'

" }}}


" EDITOR {{{
" ==================================================

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" extendable fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'vim-scripts/matchit.zip'

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
