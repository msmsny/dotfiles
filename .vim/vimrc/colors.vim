" ========================================
" " base
" ========================================
let g:molokai_original = 1
colorscheme molokai
syntax on

"全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" syntax
"通常(for molokai)
hi Normal ctermbg=NONE
"検索ハイライト
hi Search ctermfg=black ctermbg=Green cterm=NONE
hi IncSearch ctermfg=black ctermbg=Green cterm=NONE
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
"補完選択範囲
hi Visual ctermfg=black ctermbg=Green cterm=NONE
hi VisualNOC ctermfg=black ctermbg=Green cterm=NONE

" ステータスライン
"hi StatusLine gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue    " アクティブなステータスライン
"hi StatusLineNC gui=NONE guifg=Black guibg=Green cterm=NONE ctermfg=Black ctermbg=Blue  " 非アクティブなステータスライン
"hi Question gui=NONE guifg=Black guibg=Yellow cterm=NONE ctermfg=Black ctermbg=Yellow   " プロンプトメッセージ
"hi ModeMsg gui=NONE guifg=Green cterm=NONE ctermfg=Green                " --挿入--とかのメッセージ
"hi MoreMsg gui=NONE guifg=Magenta cterm=NONE ctermfg=Magenta            " --継続--メッセージ
"hi WarningMsg gui=NONE guifg=Yellow cterm=NONE ctermfg=Yellow               " 警告メッセージ
"hi ErrorMsg gui=NONE guifg=White guibg=Magenta cterm=NONE ctermfg=White ctermbg=Magenta " エラーメッセージ