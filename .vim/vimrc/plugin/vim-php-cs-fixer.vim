" ========================================
" " vim-php-cs-fixer.vim
" ========================================
" 実行ファイルパス
let g:php_cs_fixer_path = "~/git/PHP-CS-Fixer/php-cs-fixer"
let g:php_cs_fixer_php_path = "/usr/bin/php"

" map
cnoremap <silent> fix<CR> :silent call PhpCsFixerFixFile()<CR>:silent e!<CR>
