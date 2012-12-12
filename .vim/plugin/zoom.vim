if &cp || exists("g:loaded_zoom")
  finish
endif

let g:loaded_zoom = 1

let s:save_cpo = &cpo
set cpo&vim

" keep default value
let s:current_font = &guifont

" command
com! -narg=0 ZoomIn    :call s:ZoomIn()
com! -narg=0 ZoomOut   :call s:ZoomOut()
com! -narg=0 ZoomReset :call s:ZoomReset()

" guifont size + 1
function! s:ZoomIn()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" guifont size - 1
function! s:ZoomOut()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" reset guifont size
function! s:ZoomReset()
  let &guifont = s:current_font
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
finish

==============================================================================
zoom.vim : easy increase or decrease font size
------------------------------------------------------------------------------
$VIMRUNTIMEPATH/plugin/zoom.vim
==============================================================================
author  : Denis Ciccale (based on OMI TAKU version)
twitter : @tdecs
github  : http://github.com/dciccale
version : 1
==============================================================================

Easey increase or decrease Vim gui font size.

*This plugin is for GUI only*

Command-line Mode:
    :ZoomIn            ... increase font size
    :ZoomOut           ... decrease font size
    :ZoomReset         ... reset font size to user default

Custom mappins:
    " You could map zoom plugin like this:
    nmap <Leader>+ :ZoomIn<CR>
    nmap <Leader>- :ZoomOut<CR>
    nmap <Leader>= :ZoomReset<CR>

==============================================================================
Installation

Pathogen or Vundle
1. Drop the zoom folder into bundle directory.

Normal installation
1. Copy the zoom.vim script to $HOME/vimfiles/plugin or $HOME/.vim/plugin directory.
2. Restart Vim.

==============================================================================
" vim: set ff=unix expandtab ft=vim nowrap shiftwidth=2
