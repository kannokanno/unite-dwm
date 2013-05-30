let s:save_cpo = &cpo
set cpo&vim

let s:source = unite#sources#window#define()
let s:source.name = 'dwm'
let s:source.description = 'dwm.vim source'
let s:source.default_kind = 'dwm'

function! unite#sources#dwm#define()
  return s:source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
