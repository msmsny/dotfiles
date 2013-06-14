" ========================================
" " vundle
" ========================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"original repos on github
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
" vim-scripts repos
" non github repos

filetype plugin indent on
