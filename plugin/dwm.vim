if exists('g:loaded_unite_dwm') && g:loaded_unite_dwm
  finish
endif
let g:loaded_unite_dwm = 1

let s:save_cpo = &cpo
set cpo&vim

let s:action = {
      \ 'description' : 'execute DWM_New',
      \ 'is_selectable' : 1,
      \ }
function! s:action.func(candidates)
  for candidate in a:candidates
    call DWM_New()
    call unite#take_action('open', candidate)
  endfor
endfunction
call unite#custom_action('openable', 'dwm_new', s:action)
unlet s:action

let &cpo = s:save_cpo
unlet s:save_cpo
