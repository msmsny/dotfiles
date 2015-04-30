" ========================================
" " php-getter-setter.vim.vim
" ========================================
" getterテンプレート
let b:phpgetset_getterTemplate =
\ "\n" .
\ "    /**\n" .
\ "     * Gets a %varname%\n" .
\ "     *\n" .
\ "     * @return %type%\n" .
\ "     */\n" .
\ "    public function %funcname%()\n" .
\ "    {\n" .
\ "        return $this->%varname%;\n" .
\ "    }"

" setterテンプレート
let b:phpgetset_setterTemplate =
\ "\n" .
\ "    /**\n" .
\ "     * Sets a %varname%\n" .
\ "     *\n" .
\ "     * @param %type%\n" .
\ "     */\n" .
\ "    public function %funcname%(%typeHinting%$%varname%)\n" .
\ "    {\n" .
\ "        $this->%varname% = %varname%;\n" .
\ "\n" .
\ "        return $this->%varname%;\n" .
\ "    }"
