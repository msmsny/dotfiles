" ========================================
" " vim-fakeclip.vim
" ========================================
"# use tmux
let g:fakeclip_terminal_multiplexer_type = 'tmux'

"# map
nmap <silent> <Leader>yy <Plug>(fakeclip-screen-Y)
nmap <silent> <Leader>dd <Plug>(fakeclip-screen-dd)
nmap <silent> <Leader>p  <Plug>(fakeclip-screen-p)
