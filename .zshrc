# .zshrc

# User specific aliases and functions

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
autoload -Uz vcs_info

# load local functions
LOAD_FUNCTIONS=~/.zsh/load.zsh
if [ -f "$LOAD_FUNCTIONS" ]; then
  source $LOAD_FUNCTIONS
fi

# etc
# cdの履歴を保持
setopt auto_pushd
# コマンドを訂正
setopt correct
# C-sで前方検索を有効にする
setopt no_flow_control
# コマンド実行後は右プロンプトを消す
setopt transient_rprompt

# 最後にまとめてprecmd
for f in precmd_vcs_info terminal_title z_sh; do
  type $f > /dev/null 2>&1 && precmd_functions=($precmd_functions $f)
done
