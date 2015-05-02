" success_messages.vim

" 成功メッセージを元にoutputterを切り替える
" ベースはoutputter/buffered, outputter/error

let s:save_cpo = &cpo
set cpo&vim

let s:outputter = {
\   'config': {
\     'messages': [],
\     'close_buffer': 0,
\     'clear_quickfix': 0,
\   },
\ }

function! s:outputter.init(session)
  let self._result = ''
endfunction

function! s:outputter.output(data, session)
  let self._result .= a:data
endfunction

function! s:outputter.finish(session)
  let s:lines = split(self._result, "\n")

  " outputterを決める
  let s:outputter_by_message = ''
  let s:outputter_trim = 0
  let s:lines_count = 0
  for messageDict in self.config.messages
    if s:outputter_by_message == ''
      \ && has_key(messageDict, 'outputter')
      \ && has_key(messageDict, 'messages')
      for message in messageDict['messages']
        if stridx(s:lines[s:lines_count], message) != 0
          let s:outputter_by_message = messageDict['outputter']
          if has_key(messageDict, 'trim')
            let s:outputter_trim = messageDict['trim'] ? 1 : 0
          endif
          break
        else
          let s:lines_count += 1
        endif
      endfor
    endif
  endfor

  " outputterがあれば(失敗なら)出力
  if s:outputter_by_message != ''
    let outputter = a:session.make_module('outputter', s:outputter_by_message)

    " バッファのときのみ
    if s:outputter_by_message == 'buffer'
      " バッファを初期化しておく(outputter.start()は初回のみ実行なので)
      call outputter.start(a:session)
      " 先頭スペースを取り除く
      if s:outputter_trim
        let self._result = substitute(self._result, '\n \{6\}', '\n', 'g')
      endif

      " output/finish
      call outputter.output(self._result, a:session)
      call outputter.finish(a:session)

    " 成功のとき
    else
      " バッファがあれば閉じる
      if self.config.close_buffer
        for w in range(1, winnr('$'))
          let bt = getwinvar(w, '&buftype')
          if bt == 'nofile'
            execute w . 'wincmd w'
            q
            break
          endif
        endfor
      endif
    endif

    " outputterがquickfixでなければハイライトをクリアする(成功/失敗に関わらず)
    if self.config.clear_quickfix
      \ && s:outputter_by_message != 'quickfix'
      for messageDict in self.config.messages
        if has_key(messageDict, 'outputter')
          \ && messageDict['outputter'] == 'quickfix'
          cgetexpr ''
          break
        endif
      endfor
    endif
  endif
endfunction

function! quickrun#outputter#success_messages#new()
  return deepcopy(s:outputter)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
