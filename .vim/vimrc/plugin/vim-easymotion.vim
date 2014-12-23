" ========================================
" " vim-easymotion.vim
" ========================================
" デフォルトmapは無効
let g:EasyMotion_do_mapping = 0

" s{char}{char}<CR>ではじめの候補に移動
let g:EasyMotion_enter_jump_first = 1

" 大文字小文字を区別しない
let g:EasyMotion_smartcase = 1

" map
nmap s <Plug>(easymotion-s2)
