# complete
# パス補完の高速化
zstyle ':completion:*' accept-exact '*(N)'
if [ -f ~/.zsh/cache ]; then
  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path ~/.zsh/cache
fi
# 補完候補があるときはそれにする。なければ小文字大文字変換する。さらになければ大文字/小文字変換する
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# メニュー補完
zstyle ':completion:*:default' menu select=2
# カレントディレクトリに候補がないときのみcdpathから補完
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# プロセスID一覧から補完
zstyle ':completion:*:processes' command 'ps uxww -o pid,s,args'
# "."指定しなくてもドットファイルを補完対象にする
setopt globdots
# パス補完時にスラッシュを削除しない
setopt noautoremoveslash
# 補完候補をつめて表示
setopt list_packed
# 補完のときに除外するディレクトリの指定
fignore=(.svn .git)
# ホスト名補完
_cache_hosts=(`cut -f 1 -d " " $HOME/.ssh/known_hosts | cut -f 1 -d ","`)

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
