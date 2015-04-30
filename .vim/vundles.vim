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
Bundle 'kana/vim-submode'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'rhysd/clever-f.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'thinca/vim-prettyprint'
Bundle 'tyru/caw.vim'
Bundle 'h1mesuke/vim-alignta'
Bundle 'kana/vim-textobj-user'
Bundle 'osyo-manga/vim-textobj-multiblock'
Bundle 'osyo-manga/vim-textobj-multitextobj'
Bundle 'mattn/vim-textobj-url'
Bundle 'kana/vim-operator-user'
Bundle 'kana/vim-operator-replace'
Bundle 'sudo.vim'
Bundle "thinca/vim-quickrun"
Bundle "osyo-manga/vim-watchdogs"
Bundle "osyo-manga/shabadou.vim"
Bundle 'cohama/vim-hier'
Bundle 'KazuakiM/vim-qfsigns'
if executable('php')
  Bundle 'm2mdas/phpcomplete-extended'
  Bundle 'm2mdas/phpcomplete-extended-symfony'
  Bundle 'docteurklein/php-getter-setter.vim'
  Bundle 'stephpy/vim-php-cs-fixer'
endif
" vim-scripts repos
" non github repos

filetype plugin indent on
