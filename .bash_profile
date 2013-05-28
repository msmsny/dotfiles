# .bash_profile
#
# @note ログインシェルはbashのままでzshがあればzshに切り替える
#

# common
## base
LANG=ja_JP.UTF-8
PATH=/usr/local/bin:/usr/sbin:/usr/bin:/bin:/usr/ccs/bin:/usr/ucb:.
MANPATH=$MANPATH:/usr/local/man:/usr/man
EDITOR=vim
LESSCHARSET=utf-8
TERM=xterm-256color
export LANG PATH MANPATH EDITOR LESSCHARSET TERM

# run zsh if exists
ZSH=/bin/zsh
if [ -x "$ZSH" ]; then
  exec "$ZSH" -l
else
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi

  export BASH_ENV=$HOME/.bashrc
  export PAGER=/usr/bin/less

  # output stop disabled for i-search
  stty stop undef
fi
