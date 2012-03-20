# Created by newuser for 4.3.12

# base
LANG=jp_JP.UTF-8
EDITOR=vim

# color
autoload colors
colors
local RED=$'%{\e[38;05;196m%}'
local GREEN=$'%{\e[38;05;46m%}'
local YELLOW=$'%{\e[38;05;226m%}'
local BLUE=$'%{\e[38;05;16m%}'
local DEFAULT=$'%{\e[0;m%}'
local MAX_RDISPLAY=$((80 + 1))
PROMPT="${GREEN}%U[%m:%1~]%u${DEFAULT}"
RPROMPT="${GREEN}%U[%${MAX_RDISPLAY}<...<%/]%u${DEFAULT}"
precmd() {
  # terminal title
  echo -ne "\033]0;${PWD}\007"
}
export GREP_COLOR="38;05;46"

# history
HISTFILE=~/.zsh_history
# メモリ上の履歴サイズ
HISTSIZE=50000
# 保存する履歴サイズ
SAVEHIST=$HISTSIZE
# 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
# 保存するときに重複があるときは最新の1件を保存
setopt hist_save_no_dups
# 同じ履歴があるときは古いものを削除
setopt hist_ignore_all_dups
# すぐにHISTFILEに保存する→share_historyを設定していれば不要
#setopt inc_append_history
# 履歴の端末間共有
setopt share_history
# 保存するときに不要な空白を削除
setopt hist_reduce_blanks
# C-sで後方検索を使うための設定
setopt no_flow_control
# 保存条件
zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}
  local arg=${line#* }
  if [ -z "$cmd" ]; then
    return 0
  fi
  if [ "$cmd" = "$arg" ]; then
    arg=
  fi

  # rm以外で引数がある or コマンドが3文字以上のとき保存
  # @todo sudo rmも考慮する
  [ -n ${#arg} -a ${cmd} != 'rm' -o ${#line} -ge 3 ]
}

# complete
# インクリメンタル補完(user script)
#if [ -d ~/.zsh/plugin ]; then
#  source ~/.zsh/plugin/incr-0.2.zsh
#else
  autoload -U compinit
  compinit
#fi
# 補完リストがウィンドウからあふれるときはたずねる
export LISTMAX=0
# 補完候補があるときはそれにする。なければ小文字大文字変換する。さらになければ大文字/小文字変換する
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# メニュー補完
zstyle ':completion:*:default' menu select=2
# カレントディレクトリに候補がないときのみcdpathから補完
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# 補完のときに除外するディレクトリの指定(きかないっぽい？？fignoreはきく)
fignore=(.svn .cvs)
#zstyle ':completion:*:(cd|pushd):*:directories' ignored-patterns '(*/)#(.svn|.cvs)'
# z.sh
_Z_CMD=d
_ZSH=~/.zsh/plugin/rupa-z-ac62d7c/z.sh
if [ -e "$_ZSH" ]; then
  source "$_ZSH"
  precmd() {
    _z --add "$(pwd -P)"
  }
fi
# インクリメンタル補完(デフォルト)
#autoload predict-on
#predict-on
# 実験用
zstyle ':completion:*:cd:*:directories' completer _history _hosts _complete _ignored 
# きかない
#zstyle ':completion:*:cd:*:directories' fake 'testest'
# 色
#zstyle ':completion:*' list-colors 1
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s


# bind
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
# インクリメンタルパターンサーチ
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
# 単語移動
bindkey '^f' forward-word
bindkey '^b' backward-word
# C-wで単語削除
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# C-qでスペースの前まで削除
function _kill-backward-blank-word() {
  # 現在位置から左のスペースまでをkillする
  zle set-mark-command
  zle vi-backward-blank-word
  zle kill-region
}
zle -N _kill-backward-blank-word
bindkey '^q' _kill-backward-blank-word
# @todo 前方単語削除をしたい。しかし以下だと^qと同じになる
#bindkey '^t' backward-kill-line

# その他
# コマンド実行後は右プロンプトを消す(for コピペ)
setopt transient_rprompt
## 補完方法毎にグループ化する。
### 補完方法の表示方法
# @todo 使うか？
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
#zstyle ':completion:*' format '%B%d%b'
#zstyle ':completion:*' group-name ''
## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
# @todo 使う？
#zstyle ':completion:*:default' list-colors ""
## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
# @todo コマンドによって決めたい。ヒストリでもコマンド＋ファイル名などで検索した結果を表示させたい。
#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix

# alias
alias l='ls -alptr'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color=auto'
