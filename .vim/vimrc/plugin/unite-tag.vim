" ========================================
" " unite-tag.vim
" ========================================
" タグファイル名候補の表示長, 長めにとる
let g:unite_source_tag_max_fname_length = 120

" C-]でカーソル上の単語を元に候補表示
autocmd BufEnter *
\ if empty(&buftype)
\| nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\| endif
