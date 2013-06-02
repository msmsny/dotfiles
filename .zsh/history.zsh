# history
HISTFILE=~/.zsh_history
# メモリ上の履歴サイズ
HISTSIZE=50000
# 保存する履歴サイズ
SAVEHIST=$HISTSIZE
# 補完リストがウィンドウからあふれるときはたずねる
export LISTMAX=0
# historyファイルは追記
setopt append_history
# 履歴の端末間共有
setopt share_history
# 同じ履歴があるときは古いものを削除
setopt hist_ignore_all_dups
# 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
# 保存するときに不要な空白を削除
setopt hist_reduce_blanks
# 保存するときに重複があるときは最新の1件を保存
setopt hist_save_no_dups
# すぐにHISTFILEに保存する→share_historyを設定していれば不要
#setopt inc_append_history

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

  # rm, q以外で引数がある or コマンドが3文字以上のとき保存
  [[ ${#arg} -gt 0 && ${cmd} != (rm|q) || ${#cmd} -ge 3 ]]
}
