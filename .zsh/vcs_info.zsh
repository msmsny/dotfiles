# vcs_info
# @see http://linux.die.net/man/1/zshcontrib
function precmd_vcs_info() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info

  ## svn "branches"フォーマット考慮版
  ## $vcs_info_msg_0_がパス形式ならrepo/aaa/bbb/cccの"aaa/bbb/ccc"部分を削除
  ## if echo "${vcs_info_msg_0_}" | grep '/' > /dev/null 2>&1; then
  ##   psvar[1]="${vcs_info_msg_0_%%/*}"":${vcs_info_msg_0_#*:}"
  ## else
  ##   psvar[1]="${vcs_info_msg_0_}"
  ## fi

  # git
  psvar[1]="${vcs_info_msg_0_}"
}
zstyle ':vcs_info:*' enable git svn
# gitのみ有効
zstyle ':vcs_info:*' check-for-changes true
# default
zstyle ':vcs_info:*' formats '%b:'
zstyle ':vcs_info:*' actionformats '%b:'
zstyle ':vcs_info:svn:*' branchformat '%b:r%r'
# svn
# branchesごとcheckoutしたときは以下(%Sは"branches"以下のパス)
# リビジョンは表示しない(リビジョンが固定になるので)
zstyle ':vcs_info:*:*:branches' formats '%S:'
