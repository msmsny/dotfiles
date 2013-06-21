" ========================================
" " neosnippet
" ========================================
" Enterで補完候補決定, パラメータ決定
" snippetでないときは通常の補完
imap <expr><CR> neosnippet#expandable_or_jumpable() ? neocomplcache#close_popup() . "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplcache#close_popup() . "\<CR>" : "\<CR>"
smap <expr><CR> neosnippet#expandable_or_jumpable() ? neocomplcache#close_popup() . "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ユーザ定義snippet
if !exists("g:neosnippet#snippets_directory")
    let g:neosnippet#snippets_directory=""
endif
if isdirectory(expand("~/.vim/bundle/neocomplcache/snippets"))
  let g:neosnippet#snippets_directory="~/.vim/bundle/neocomplcache/snippets"
endif
