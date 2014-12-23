" ========================================
" " vim-textobj-multitextobj.vim
" ========================================
let g:textobj_multitextobj_textobjects_i = [
\  "\<Plug>(textobj-url-i)",
\  "\<Plug>(textobj-multiblock-i)",
\]

" map
omap am <Plug>(textobj-multitextobj-a)
omap im <Plug>(textobj-multitextobj-i)
vmap am <Plug>(textobj-multitextobj-a)
vmap im <Plug>(textobj-multitextobj-i)
