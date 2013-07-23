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
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'epmatsw/ag.vim'
Bundle 'taiansu/nerdtree-ag'
" vim-scripts repos
" non github repos

filetype plugin indent on
