scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:hook = shabadou#make_hook_points_modules({
\   'name'  : 'reload',
\   'kind'  : 'hook',
\   'config': {'enabled': 0},
\ })

function! s:hook.on_exit(...)
  if self.config.enabled
    " 再読み込みでハイライトがリセットされるので元に戻す
    silent e! | execute 'setlocal filetype='.&filetype
  endif
endfunction

function! quickrun#hook#reload#new()
  return deepcopy(s:hook)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
