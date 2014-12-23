" ========================================
" " base
" ========================================
" autocmdを初期化してから読み込み
augroup autocmd_vimrc
  autocmd!
augroup END
autocmd autocmd_vimrc FileType * set textwidth=0
autocmd autocmd_vimrc FileType * set formatoptions-=ro
autocmd autocmd_vimrc BufWritePost .vimrc,*.vim nested source $HOME/.vimrc

set backspace=2
set number
set tabstop=4
set showmatch
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs2le,ucs-2,cp932,jis,sjis
set hlsearch
set ignorecase
set smartcase
set ambiwidth=double
set nobackup
"# swap file directory
set directory=$HOME/.vim/backup
"# ignore bell
set visualbell t_vb=

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
"タブ文字の可視化
set list
set listchars=tab:>\ 
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う→いらない
"set smartindent
"カーソルを行頭、行末で止まらないようにする→いらない
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない→いらない
"set nowrapscan

" syntax
"タブを空白に
set expandtab
" clipboard
set clipboard+=unnamed
" スクリプト再読み込み(手動)
nnoremap <Leader><C-r> :execute "source " expand("%:p")<CR>

"# path
let $PATH = "/usr/local/bin:" . $PATH

"# map
" ジャンプリストのカーソル位置移動, mapleaderの前に定義しておく
nnoremap <silent> <S-Left>  <C-o>
nnoremap <silent> <S-Right> <C-i>

" <Leader>
let mapleader = "\<C-i>"

" 検索ハイライトを元に戻す
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><Esc>

" 検索時にジャンプリストに履歴を残さない
nnoremap ? :keepj /
nnoremap n :<C-u>execute 'keepjumps normal! n'<CR>
nnoremap N :<C-u>execute 'keepjumps normal! N'<CR>

"# バッファ移動
nnoremap <silent> <M-Left>  :bp<CR>
nnoremap <silent> <M-Right> :bn<CR>

"# ウィンドウ移動
nnoremap <silent> <C-S-Up>    <C-W>k
nnoremap <silent> <C-S-Down>  <C-W>j
nnoremap <silent> <C-S-Left>  <C-W>h
nnoremap <silent> <C-S-Right> <C-W>l
