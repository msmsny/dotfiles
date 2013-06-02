function _precmd() {
  local func
  for func in $precmd_functions; do
    $func
  done
}
