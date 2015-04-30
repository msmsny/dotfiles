" ========================================
" " vim-watchdogs.vim
" ========================================
" 設定
" - ファイル保存時に自動実行
" - デフォルトで非同期実行(runner: vimproc), sleep, updatetimeは適当(msec)
" - シンタックス/コーディングスタイルチェック(watchdogs_checker/php)
"   - シンタックスチェック(php -l)
"     - はじめに実行される
"     - errorのときのみquickfixに出力(outputter, outputter/error/error)
"     - quickfixは開かない(outputter/quickfix/open_cmd: '')(開くと後続のphp-cs-fixerが正しく動かない)
"     - qfsignsを使う(hook/qfsigns_update/*)
"     - vim-hier, qfsingsで結果をハイライト
"   - コーディングスタイルチェック(php-cs-fixer)
"     - php -lのあとに実行, php -lが成功したときのみ有効(失敗のときは成功扱いとなりチェックが効かない)
"     - successのときのみbufferに出力
"       php-cs-fixerの成功/失敗に関わらずなぜかsuccess扱いになるのでここに定義
"       php-cs-fixer自体は結果コードを返しているがそれが反映されない
"     - 自前定義のoutputter/buffered_phpでfinish()をhook
"       すべてOKのときにbufferを表示しないために出力文字列ですべてOKかどうかを判定する
"       NGのときはquickrun付属のbufferで出力
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
\   'command'                          : s:path_php,
\   'exec'                             : ['%c -l %s:p', '%c '.s:path_php_cs_fixer.' fix --dry-run --diff %s:p'],
\   'outputter'                        : 'error',
\   'outputter/error/error'            : 'quickfix',
\   'outputter/error/success'          : 'buffered_php',
\   'outputter/buffered_php/target'    : 'buffer',
\   'outputter/buffer/name'            : 'checker/fixer executed.',
\   'outputter/buffer/split'           : ':vertical rightbelow',
\   'outputter/quickfix/open_cmd'      : '',
\   'hook/qfsigns_update/enable_exit'  : 1,
\   'hook/qfsigns_update/priority_exit': 3,
\ }
endif

let g:watchdogs_check_BufWritePost_enables = {
\ 'php' : 1,
\}

call watchdogs#setup(g:quickrun_config)
