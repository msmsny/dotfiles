# preload
ZSH_FUNCTIONS="$HOME/.zsh"
## z.sh
Z_SH="$ZSH_FUNCTIONS/z.sh"
_Z_CMD=d
function z_sh() {
  _z --add "$(pwd -P)"
}
test -f "$Z_SH" -a ! -f ~/.z && touch ~/.z
## 読み込まないリスト
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
  fns=(`find $ZSH_FUNCTIONS/* -type f -o -type l | egrep -v "$0|$ZIGNORE|$IGNORE_FUNCTIONS" | tr -s '\n' ' '`)
  if [ -n "$fns" ]; then
    for fn in $fns; do
      source $fn
    done
  fi
fi
