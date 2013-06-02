CDUP_SYMBOL='\^'
function cdup() {
  if [ -z "$BUFFER" ]; then
    echo
    cd ..
    _precmd
    zle reset-prompt
  else
    zle self-insert "$CDUP_SYMBOL"
  fi
}
zle -N cdup
bindkey "$CDUP_SYMBOL" cdup
