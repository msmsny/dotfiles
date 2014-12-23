" ========================================
" " vim-session.vim
" ========================================
" セッションファイルは上書き
let g:session_default_overwrite = 1

" autosave, autoloadしない
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" map
cnoremap qq<CR> :SaveSession!<CR>:q<CR>
nnoremap <Leader>s :OpenSession!<CR>
