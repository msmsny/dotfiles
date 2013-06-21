" ========================================
" " unite.vim
" ========================================
" 入力モードで開始
let g:unite_enable_start_insert=1

" map
"" ショートカットメニュー
nnoremap <silent> <Leader><Leader> :Unite menu:shortcut<CR>
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
" <ESC><ESC>でunite終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" file_mruを速く
let g:unite_source_file_mru_filename_format = ''

" ショートカットメニュー
let g:unite_source_menu_menus = {
\ "shortcut" : {
\   "description" : "shortcut menu:",
\   "command_candidates" : [
\     ["file_mru"     , "Unite file_mru"],
\     ["file"         , "Unite -buffer-name=file file"],
\     ["buffer"       , "Unite buffer"],
\     ["withBufferDir", "UniteWithBufferDir -buffer-name=file file"],
\     ["register"     , "Unite -buffer-name=register register"],
\   ],
\ },
\}
