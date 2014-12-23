" ========================================
" " base
" ========================================
"# colorscheme
"## colorschemeがないとおこられるのでプラグイン側(~/.vim/vimrc/plugin以下)で指定する
syntax on

"# syntax
"## 全角スペースの可視化
"## @todo 背景色が設定されない(あとに設定したものが反映されてしまう)のでなおす
augroup HighlightDoubleByteSpace
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight DoubleByteSpace cterm=bold ctermbg=161 gui=bold guibg=#F92672
  autocmd VimEnter,WinEnter * match DoubleByteSpace /　/
augroup END
"## 行末スペースの可視化
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces cterm=bold ctermbg=161 gui=bold guibg=#F92672
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"## 通常(for molokai)
hi Normal ctermbg=NONE
"## 検索ハイライト
hi Search ctermfg=black ctermbg=Green cterm=reverse,underline
"## インクリメンタルサーチ, 置換
hi IncSearch ctermfg=NONE ctermbg=NONE cterm=reverse
"## 括弧
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black
"## モード
hi ModeMsg ctermfg=Green ctermbg=NONE cterm=NONE
"## エラーメッセージ
hi ErrorMsg ctermfg=Green ctermbg=NONE cterm=NONE
"## 行番号
hi LineNr ctermfg=Green ctermbg=NONE cterm=NONE
"## カレント行
"set cursorline
"hi CursorLine ctermbg=LightBlue
"## snippet補完デフォルト値
hi Visual ctermfg=black ctermbg=Green cterm=NONE
hi VisualNOC ctermfg=black ctermbg=Green cterm=NONE
"## ポップアップメニュー(for neocomplcache)
hi Pmenu ctermbg=8 ctermfg=NONE guibg=#606060
hi PmenuSel ctermbg=8 ctermfg=Green guibg=#606060
hi PmenuSbar ctermbg=0 guibg=#d6d6d6

" ステータスライン
"hi StatusLine gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue    " アクティブなステータスライン
"hi StatusLineNC gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue  " 非アクティブなステータスライン
"hi Question gui=NONE guifg=Black guibg=Yellow cterm=NONE ctermfg=Black ctermbg=Yellow   " プロンプトメッセージ
"hi ModeMsg gui=NONE guifg=Green cterm=NONE ctermfg=Green                " --挿入--とかのメッセージ
"hi MoreMsg gui=NONE guifg=Magenta cterm=NONE ctermfg=Magenta            " --継続--メッセージ
"hi WarningMsg gui=NONE guifg=Yellow cterm=NONE ctermfg=Yellow               " 警告メッセージ
"hi ErrorMsg gui=NONE guifg=White guibg=Magenta cterm=NONE ctermfg=White ctermbg=Magenta " エラーメッセージ
