" ========================================
" " vim-submode.vim
" ========================================
try
  " C-wでウィンドウ調整モード, 連続入力できるように
  call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('bufmove', 'n', '', '>', '<C-w>>')
  call submode#map('bufmove', 'n', '', '<', '<C-w><')
  call submode#map('bufmove', 'n', '', '+', '<C-w>+')
  call submode#map('bufmove', 'n', '', '-', '<C-w>-')
catch /E117.*/
endtry
