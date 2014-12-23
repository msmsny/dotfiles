" ========================================
" " nerdtree.vim
" ========================================
"# 隠しファイルを表示する
let g:NERDTreeShowHidden=1
"# ディレクトリをシングルクリックで表示する
let g:NERDTreeMouseMode=2
"# 矢印の形式
"## mac以外だと正しく表示されないようなので+/-表示にする
if g:os != "Darwin\n"
  let g:NERDTreeDirArrows=0
endif
"# 分割openのマッピングを変更
"## 's'はeasymotionとかぶるので変える, 水平分割もついでに変えておく
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenSplit  = 'h'
"# bookmark
let g:NERDTreeBookmarksFile = $HOME . '.vim/bundle/nerdtree/.NERDTreeBookmarks'
"# 引数なしでvim起動時にNERDTreeを起動する
"  ただし"vim -R -"では起動しない
autocmd vimenter * if !argc() && &ro == 0 | NERDTree | endif
"# バッファがなくなったらNERDTreeも閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"# map
nnoremap <silent> <Leader>i :NERDTreeToggle<CR>
nnoremap <silent> <Leader>q :NERDTreeClose<CR>
