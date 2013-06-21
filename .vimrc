" ========================================
" " base
" ========================================
let s:path_base          = "~/.vim"
let s:path_vimrc         = s:path_base  . "/vimrc"
let s:path_general       = s:path_vimrc . "/general.vim"
let s:path_vundle_dir    = s:path_base  . "/bundle/vundle"
let s:path_vundle_script = s:path_base  . "/vundles.vim"
let s:path_plugin_prefix = s:path_vimrc . "/plugin/"
let s:path_plugin_suffix = ".vim"

if filereadable(expand(s:path_general))
  execute "source " . s:path_general
endif

" ========================================
" " vundle
" ========================================
" vundleが存在するときのみ
if isdirectory(expand(s:path_vundle_dir))
  " vundles.vimが存在するときのみ
  if filereadable(expand(s:path_vundle_script))
    " vundleを読み込む
    execute "source " . s:path_vundle_script

    " ローカルのプラグイン設定
    " @note source ...ならvundleのあとに読み込んでもOK
    "       runtime! ...はvundleの前に読み込む必要がある
    for name in map(copy(g:bundles), 'v:val.name')
      if filereadable(expand(s:path_plugin_prefix . name . s:path_plugin_suffix))
        execute "source " . s:path_plugin_prefix . name . s:path_plugin_suffix
      endif
    endfor
  endif
endif
