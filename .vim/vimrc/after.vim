" ========================================
" " 最後に読み込む設定
" ========================================
"# 最後にインデント(htmlのときにデフォルトのインデントを付加するため)
set autoindent
"# htmlはインデントがおかしくなるのですでに設定されているインデントは無効にする
autocmd FileType html set indentexpr&
