" ========================================
" " syntastic.vim
" ========================================
"# エラー行にマークを表示する
let g:syntastic_enable_signs = 1
"# エラーがあったときに自動でウィンドウ表示しない,
"# エラーがなければウィンドウを閉じる
let g:syntastic_auto_loc_list = 2
"# php, javascriptのファイルは保存時にチェック
"## active_filetypes  : passive modeのときにチェックするファイルタイプ
"## passive_filetypes : active modeのときにチェックしないファイルタイプ
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes'  : ['php', 'javascript'],
  \ 'passive_filetypes' : [] }
"# phpの構文チェックのみ(phpcs, phpmdは使わない)
let g:syntastic_php_checkers = ['php']
"# jshintの構文チェック
"## @note jshintをインストールしないと何もおこらない
let g:syntastic_javascript_checkers = ['jshint']
"# ".html"の構文チェック
"## @todo ".html"はphpとjshintのチェック両方やりたい
let g:syntastic_filetype_map = { 'html' : 'javascript' }
"# wq保存時にチェックしない
"## @note しかしこの設定値は機能していないっぽい..
let g:syntastic_check_on_wq = 0
"# map
cnoremap <silent> ww<CR>  :w<CR>:SyntasticCheck<CR>
cnoremap <silent> wwq<CR> :w<CR>:SyntasticCheck<CR>:q<CR>
