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
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'tsukkee/unite-tag'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'epmatsw/ag.vim'
Bundle 'taiansu/nerdtree-ag'
Bundle 'tpope/vim-pathogen'
Bundle 'scrooloose/syntastic'
Bundle 'm2mdas/phpcomplete-extended'
Bundle 'm2mdas/phpcomplete-extended-symfony'
" vim-scripts repos
" non github repos

filetype plugin indent on
