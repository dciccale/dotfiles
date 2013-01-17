" plugins managed by vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent nofoldenable

" SnipMate
Bundle 'msanders/snipmate.vim'

" Stylus syntax highlight (doesn't feel is working right)
Bundle 'wavded/vim-stylus'

" my custom molokai theme (denkai)
Bundle 'dciccale/denkai.vim'
colorscheme denkai

" Jade
Bundle 'digitaltoad/vim-jade'

" Zoom (easy increase/decrease vim font size)
Bundle 'dciccale/guizoom.vim'
map <leader>+ :ZoomIn<CR>
map <leader>- :ZoomOut<CR>
map <leader>= :ZoomReset<CR>

" delimitMate
Bundle 'Raimondi/delimitMate'

" AutoCloseTag
Bundle 'HTML-AutoCloseTag'

" matchit (extended % matching)
Bundle 'matchit.zip'

" Better CSS Syntax highlight
Bundle 'Better-CSS-Syntax-for-Vim'

" supertab
Bundle 'ervandew/supertab'

" better javascript syntax
Bundle 'JavaScript-syntax'
