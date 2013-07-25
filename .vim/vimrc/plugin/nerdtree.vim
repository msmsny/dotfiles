" ========================================
" " nerdtree.vim
" ========================================
"# 隠しファイルを表示する
let g:NERDTreeShowHidden=1
"# ディレクトリをシングルクリックで表示する
let g:NERDTreeMouseMode=2
"# 矢印の形式
"## mac以外だと正しく表示されないようなので+/-表示にする
if system('uname') != "Darwin\n"
  let g:NERDTreeDirArrows=0
endif
"# 引数なしでvim起動時にNERDTreeを起動する
autocmd vimenter * if !argc() | NERDTree | endif
"# バッファがなくなったらNERDTreeも閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"# map
nnoremap <silent> <Leader>i :NERDTreeToggle<CR>
nnoremap <silent> <Leader>q :NERDTreeClose<CR>
