# bind
bindkey '^h' peco-select-history
bindkey '^j' peco-z

# 履歴検索
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history

# z + ジャンプ
function peco-z() {
    local selected_dir=$(d -l | sort -nr -k 1 | awk '{print $2}' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-z

# ag + vim
function agv() {
    local selected
    selected=$(ag "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
    test -n "$selected" && vim `echo "$selected"`
}

# ls + vim
function lv() {
    local list
    list=$(ls -alptr "$@" | peco --query "$LBUFFER")
    list="`echo $list | awk '{print $10}'`"
    # ディレクトリならcd+lv
    if [ -d "$list" ]; then
        cd `echo "$list"` && lv
    # ファイルならvimで開く
    elif [ -f "$list" ]; then
        vim `echo "$list"`
    fi
}
