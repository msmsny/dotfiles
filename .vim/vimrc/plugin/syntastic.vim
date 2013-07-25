" ========================================
" " syntastic.vim
" ========================================
"# エラー行にマークを表示する
let g:syntastic_enable_signs = 1
"# エラーがあったときに自動でウィンドウ表示しない,
"# エラーがなければウィンドウを閉じる
let g:syntastic_auto_loc_list = 2
"# php, javascriptのファイルは保存時にチェック
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['php', 'javascript', 'json'],
  \ 'passive_filetypes': [] }
"# phpの構文チェックのみ(phpcs, phpmdは使わない)
let g:syntastic_php_checkers = ['php']
"# jshintの構文チェック
let g:syntastic_javascript_checker = 'jshint'
