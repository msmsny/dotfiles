" ========================================
" " 最後に読み込む設定
" ========================================
"# 最後にインデント(htmlのときにデフォルトのインデントを付加するため)
set autoindent
"# htmlはインデントがおかしくなるのですでに設定されているインデントは無効にする
autocmd FileType html set indentexpr&

"# yank履歴の保存設定
"## '100 : 100ファイルまで履歴を記憶する
"## <50  : 各50行まで登録する
"## s10  : viminfoファイルの上限サイズ(KB)
"## h    : hlsearchのハイライトが再現されない
set viminfo='100,<100000,s100000,h

"# formatoptionsはgeneral.vimで定義すると正しく反映されないのでここで設定
"## formatoptions
"   http://vimwiki.net/?%27formatoptions%27
"## 折り返しだけしなければいいので"t"指定(filetype=phpのときは自動で削除される)
"   http://vim-jp.org/vimdoc-ja/indent.html#php-indent
"## "r"はdocblockを書くときにわりと便利なので無効にしない
autocmd FileType * setlocal formatoptions-=t
