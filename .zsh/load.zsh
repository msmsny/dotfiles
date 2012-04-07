# init
ZSH_FUNCTIONS=~/.zsh
## disable auto-fu highlight, suffix
AUTO_FU_NOCP=1

# 読み込まないリスト
IGNORE_FUNCTIONS=
ZIGNORE="$ZSH_FUNCTIONS/zignore"
if [ -f "$ZIGNORE" ]; then
  for f in `cat "$ZIGNORE" | egrep -v '^#'`; do
    if [ -n "$IGNORE_FUNCTIONS" ]; then
      IGNORE_FUNCTIONS="$IGNORE_FUNCTIONS|$ZSH_FUNCTIONS/$f"
    else
      IGNORE_FUNCTIONS="$ZSH_FUNCTIONS/$f"
    fi
  done
fi

# source
if [ -d "$ZSH_FUNCTIONS" ]; then
  fns=(`find $ZSH_FUNCTIONS -type f -o -type l | egrep -v "$0|$ZIGNORE|$IGNORE_FUNCTIONS" | tr -s '\n' ' '`)
  if [ -n "$fns" ]; then
    for fn in $fns; do
      source $fn
    done
  fi
fi

# auto-fu init
function zle-line-init() {
  auto-fu-init
}
if [ -n "`cat $fns | grep 'auto-fu.zsh'`" ]; then
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
  zle -N zle-keymap-select auto-fu-zle-keymap-select
  zstyle ':auto-fu:var' autoable-function/skipwords "('|$'|\")*" "^((???)##)"
  # C-cの動作をデフォルトに戻す
  TRAPINT() {
    if [[ -o zle ]]; then
      zle -I
      case "$LASTWIDGET" in
        # 補完のタイミングによって先頭にドットがつくので'*'をつける
        # 入力中, 削除中, 補完完了, 履歴上下
        *self-insert | *backward-delete-char | *afu+complete-word | *up-line-or-history | *down-line-or-history )
          zle kill-buffer
          zle -R '' ;;
        # isearch中など
        *zle-keymap-select )
          zle send-break ;;
        # その他はsend-breakにしておく
        * )
          zle send-break ;;
      esac
    fi
  }
fi
