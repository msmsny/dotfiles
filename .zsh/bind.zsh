# bind
bindkey -e
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
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
