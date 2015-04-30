" ========================================
" " vim-watchdogs.vim
" ========================================
" 設定
" - ファイル保存時に自動実行
" - デフォルトで非同期実行(runner: vimproc), sleep, updatetimeは適当(msec)
" - シンタックス/コーディングスタイルチェック(watchdogs_checker/php)
"   結果メッセージの内容によってoutputterを出し分ける(success_messages)
"   - シンタックスチェック(php -l)
"     - はじめに実行される
"     - エラーならquickfixに出力(outputter/success_messages/messages/0/outputter)
"       "No syntax error detected"でなければエラー
"     - quickfixは開かない(outputter/quickfix/open_cmd: '')(開くと後続のphp-cs-fixerが正しく動かない)
"     - qfsignsを使う(hook/qfsigns_update/*)
"     - vim-hier, qfsingsで結果をハイライト
"   - コーディングスタイルチェック(php-cs-fixer)
"     - php -lのあとに実行, php -lが成功したときのみ有効(失敗のときは成功扱いとなりチェックが効かない)
"     - エラーならbufferに出力(outputter/success_messages/messages/1/outputter)
"       "Fixed all files"が1行目に出力されていなければエラー
"       php-cs-fixerの成功/失敗に関わらずなぜかsuccess扱いになる点に注意
"       phpスクリプト版php-cs-fixerは結果コードを正しく返さない(スタンドアロン版php-cs-fixerは正しく返す)
"     - すべてOKのときは何もしない
"       前述のように結果コードだけでは判断できないので出力文字列ですべてOKかどうかを判定する
" ========================================
let g:quickrun_config = {
\  'watchdogs_checker/_': {
\    'runner'                   : 'vimproc',
\    'runner/vimproc/sleep'     : 1,
\    'runner/vimproc/updatetime': 10,
\  },
\}

let s:path_php = '/usr/bin/php'
let s:path_php_cs_fixer = expand('~/work/php-cs-fixer')
if executable(s:path_php) && executable(s:path_php_cs_fixer)
  let g:quickrun_config['watchdogs_checker/php'] = {
\   'command'                                 : s:path_php,
\   'exec'                                    : ['%c -l %s:p', '%c '.s:path_php_cs_fixer.' fix --dry-run --diff %s:p'],
\   'outputter'                               : 'success_messages',
\   'outputter/buffer/filetype'               : 'diff',
\   'outputter/buffer/name'                   : '[php-cs-fixer results]',
\   'outputter/buffer/split'                  : ':vertical rightbelow',
\   'outputter/quickfix/open_cmd'             : '',
\   'outputter/success_messages/messages'     : [
\     {'outputter'                            : 'quickfix', 'messages': ['No syntax errors detected']},
\     {'outputter'                            : 'buffer'  , 'messages': ['Fixed all files'], 'trim': 1},
\   ],
\   'outputter/success_message/close_buffer'  : 1,
\   'outputter/success_message/clear_quickfix': 1,
\   'hook/qfsigns_update/enable_exit'         : 1,
\   'hook/qfsigns_update/priority_exit'       : 3,
\ }
endif

let g:watchdogs_check_BufWritePost_enables = {
\ 'php' : 1,
\}

call watchdogs#setup(g:quickrun_config)
