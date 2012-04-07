# aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# common functions
if [ -f ~/.functions ]; then
  source ~/.functions
fi

# autoload
autoload colors && colors
autoload -U compinit && compinit
#autoload predict-on && predict-on

# load local functions
LOAD_FUNCTIONS=~/.zsh/load.zsh
if [ -f "$LOAD_FUNCTIONS" ]; then
  source $LOAD_FUNCTIONS
fi

# base
export LANG=ja_JP.UTF-8
export EDITOR=vim
export TERM=xterm-256color

# color
local RED=$'%{\e[38;05;196m%}'
local GREEN=$'%{\e[38;05;46m%}'
local YELLOW=$'%{\e[38;05;226m%}'
local BLUE=$'%{\e[38;05;16m%}'
local DEFAULT=$'%{\e[0;m%}'
local MAX_RDISPLAY=$((80 + 1))
PROMPT="${GREEN}%U[%m:%1~]%u${DEFAULT}"
RPROMPT="${GREEN}%U[%${MAX_RDISPLAY}<...<%/]%u${DEFAULT}"
function terminal_title() {
  print -Pn "\e]2;[%m:%~] %n \a"
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

  # コマンドがないときは保存しない
  if [ -z "$cmd" ]; then
    return 0
  fi
  # sudoのとき
  if [ "$cmd" = "sudo" ]; then
    _arg="`echo $arg | sed -e 's/\s\{1,\}/ /g' | sed -e 's/^\s\{1,\}//'`"
    cmd=${_arg%% *}
    arg=${_arg#* }
    if [ "$cmd" = "-u" ]; then
      cmd="`echo $arg | cut -f 2 -d ' '`"
      arg="`echo $arg | cut -f 3 -d ' '`"
    fi
  fi
  # 引数がなしのときの初期化
  if [ "$cmd" = "$arg" ]; then
    arg=
  fi

  # rm以外で引数がある or コマンドが3文字以上のとき保存
  [ -n ${#arg} -a "${cmd}" != 'rm' -o ${#line} -ge 3 ]
}

# complete
# パス補完の高速化
zstyle ':completion:*' accept-exact '*(N)'
if [ -f ~/.zsh/cache ]; then
  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path ~/.zsh/cache
fi
# パス補完時にスラッシュを削除しない
setopt noautoremoveslash
# 補完リストがウィンドウからあふれるときはたずねる
export LISTMAX=0
# 補完候補があるときはそれにする。なければ小文字大文字変換する。さらになければ大文字/小文字変換する
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# メニュー補完
zstyle ':completion:*:default' menu select=2
# カレントディレクトリに候補がないときのみcdpathから補完
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# プロセスID一覧から補完
zstyle ':completion:*:processes' command 'ps uxww -o pid,s,args'
# 補完のときに除外するディレクトリの指定
fignore=(.svn .cvs)
# z.sh
_Z_CMD=d
Z_SH="$ZSH_FUNCTIONS/z.sh"
if [ -e "$Z_SH" ]; then
  source "$Z_SH"
  function z_sh() {
    _z --add "$(pwd -P)"
  }
fi

# bind
bindkey -e
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

# etc
# コマンド実行後は右プロンプトを消す
setopt transient_rprompt
# コマンドを訂正
setopt correct

# 最後にまとめてprecmd
for f in terminal_title z_sh; do
  which $f > /dev/null 2>&1 && precmd_functions=($precmd_functions $f)
done
