" ========================================
" " phpcomplete-extended.vim
" ========================================
" phpコマンド
let g:phpcomplete_extended_php_command = "/usr/bin/php"
" composerコマンド
let g:phpcomplete_index_composer_command = "/usr/local/bin/composer"

" デフォルトマッピングは無効にする(<Leader><Leader>uがUniteのmapに影響するため)
let g:phpcomplete_extended_use_default_mapping = 0

" neocomplecache連携
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

" map
"" 補完候補表示
inoremap <S-Tab><S-Tab> <C-x><C-o>
"" namespace補完
inoremap <C-u> <C-o>:call phpcomplete_extended#addUse(expand('<cword>'), '')<CR>
nnoremap <silent> <Leader><C-u> :call phpcomplete_extended#addUse(expand('<cword>'), '')<CR>
