" ========================================
" " unite.vim
" ========================================
" 入力モードで開始
let g:unite_enable_start_insert=1

" map
"" ショートカットメニュー
nnoremap <silent> <Leader><Leader> :Unite menu:shortcut<CR>
au FileType unite inoremap <silent> <buffer> <Leader> <ESC>:q<CR>:Unite menu:shortcut<CR>
"" 最近使ったファイル一覧
nnoremap <silent> <Leader>f        :Unite file_mru<CR>
"" ファイル一覧
nnoremap <silent> <Leader><C-f>    :Unite -buffer-name=file file<CR>
"" バッファ一覧
nnoremap <silent> <Leader>b        :Unite buffer<CR>
"" バッファのディレクトリ一覧
nnoremap <silent> <Leader><C-b>    :UniteWithBufferDir -buffer-name=file file<CR>
"" レジスタ一覧
nnoremap <silent> <Leader>r        :Unite -buffer-name=register register<CR>
"" ジャンプリスト
nnoremap <silent> <Leader><C-j>    :Unite jump<CR>
"" phpcomplete/files
nnoremap <silent> <Leader><C-p>    :Unite phpcomplete/files<CR>
"" symfony/services
nnoremap <silent> <Leader>s        :Unite symfony/services<CR>
" <ESC><ESC> or <C-c>でunite終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite nnoremap <silent> <buffer> <C-c>      :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
au FileType unite inoremap <silent> <buffer> <C-c>      <ESC>:q<CR>
" バッファの末尾スペースを可視化しない
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  au BufWinEnter * match TrailingSpaces //
endfunction

" file_mruを速く
let g:unite_source_file_mru_filename_format = ''

" ヤンク履歴
let g:unite_source_history_yank_enable =1
"" 末尾スペースを可視化させないためにnoautocmd
nnoremap <silent> <Leader>h :noautocmd Unite history/yank<CR>

" ショートカットメニュー
let g:unite_source_menu_menus = {
\ "shortcut" : {
\   "description" : "shortcut menu:",
\   "command_candidates" : [
\     ["phpcomplete/files"         , "Unite phpcomplete/files"],
\     ["symfony/services"          , "Unite symfony/services"],
\     ["symfony/tags"              , "Unite symfony/tags"],
\     ["symfony/bundles"           , "Unite symfony/bundles"],
\     ["symfony/entities"          , "Unite symfony/entities"],
\     ["symfony/routes_by_name"    , "Unite symfony/routes_by_name"],
\     ["symfony/routes_by_pattern" , "Unite symfony/routes_by_pattern"],
\     ["jump"                      , "Unite jump"],
\     ["source"                    , "Unite source"],
\     ["file_mru"                  , "Unite file_mru"],
\     ["file"                      , "Unite -buffer-name=file file"],
\     ["buffer"                    , "Unite buffer"],
\     ["withBufferDir"             , "UniteWithBufferDir -buffer-name=file file"],
\     ["register"                  , "Unite -buffer-name=register register"],
\   ],
\ },
\}
