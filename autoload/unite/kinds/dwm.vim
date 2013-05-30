let s:save_cpo = &cpo
set cpo&vim

function! unite#kinds#dwm#define()
  return s:kind
endfunction

let s:kind = {
      \ 'name' : 'dwm',
      \ 'default_action' : 'focus',
      \ 'action_table': {},
      \ 'parents' : ['window'],
      \}

let s:kind.action_table.focus = {
      \ 'description' : 'execute DWM_Focus',
      \ }
function! s:kind.action_table.focus.func(candidate)
  call unite#take_action('open', a:candidate)
  call DWM_Focus()
endfunction

let s:kind.action_table.delete = {
      \ 'description' : 'execute DWM_Close',
      \ 'is_selectable' : 1,
      \ }
function! s:kind.action_table.delete.func(candidates)
  for candidate in a:candidates
    call unite#take_action('open', a:candidate)
    call DWM_Close()
  endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
