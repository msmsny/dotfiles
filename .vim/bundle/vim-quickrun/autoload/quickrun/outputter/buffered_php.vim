let s:save_cpo = &cpo
set cpo&vim

let s:outputter = {
\   'config': {
\     'target': '',
\   },
\ }

function! s:outputter.init(session)
  let self._result = ''
endfunction

function! s:outputter.output(data, session)
  let self._result .= a.data
endfunction

function! s:outputter.finish(session)
  " すべて成功の文言が出力されていれば何もしない
  " それ以外の何かが出力されていればbufferに出力
  let s:lines = split(self._result, "\n")
  if len(s:lines) != 2
    \ || stridx(s:lines[0], 'No syntax errors detected') != 0
    \ || stridx(s:lines[1], 'Fixed all files') != 0

    let outputter = a:session.make_module('outputter', self.config.target)
    call outputter.output(self._result, a:session)
    call outputter.finish(a:session)
  endif
endfunction

function! quickrun#outputter#buffered_php#new()
  return deepcopy(s:outputter)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
