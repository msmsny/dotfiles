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
"# <Leader>
let mapleader = "\<C-i>"

"インデントしない
set noautoindent
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
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う→いらない
"set smartindent
"カーソルを行頭、行末で止まらないようにする→いらない
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない→いらない
"set nowrapscan
"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" syntax
"set term=builtin_linux
"set ttytype=builtin_linux
"set t_Co=256
"検索ハイライト
hi Search ctermfg=Green ctermbg=NONE cterm=NONE
hi IncSearch ctermfg=Green ctermbg=NONE cterm=NONE
"括弧
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black
"モード
hi ModeMsg ctermfg=Green ctermbg=NONE cterm=NONE
"エラーメッセージ
hi ErrorMsg ctermfg=Green ctermbg=NONE cterm=NONE
"行番号
hi LineNr ctermfg=Green ctermbg=NONE cterm=NONE
"カレント行
"set cursorline
"hi CursorLine ctermbg=LightBlue
"タブを空白に
set expandtab
" clipboard
set clipboard+=unnamed
" スクリプト再読み込み(手動)
nnoremap <Leader><C-r> :execute "source " expand("%:p")<CR>
