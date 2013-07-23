" ========================================
" " neocomplcache
" ========================================
if !exists("g:bundles")
  finish
endif

let g:neocomplcache_enable_at_startup = 1
" 補完ウィンドウ設定
set completeopt=menuone
" 最大補完候補数
let g:neocomplcache_max_list = 20
" 自動補完開始値
let g:neocomplcache_auto_completion_start_length = 2
" 手動補完開始値
let g:neocomplcache_manual_completion_start_length = 3
" 補完対象キーワード最小値
let g:neocomplcache_min_keyword_length = 4
" 補完対象キーワード最小値(シンタックスファイル)
let g:neocomplcache_min_syntax_length = 4
" 大文字を含むときに大文字小文字の区別
let g:neocomplcache_enable_smart_case = 1
" 大文字小文字を無視して検索
let g:neocomplcache_enable_ignore_case = 1
" 改行/バックスペースで補完候補を閉じる
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><C-h> neocomplcache#close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#close_popup()."\<C-h>"
" 補完候補削除
inoremap <expr><C-c> neocomplcache#cancel_popup()
" タブで補完候補を選択
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" タブのときのみ補完
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
