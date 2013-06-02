# prompt
PROMPT="${GREEN}%U[%m:%1~]%u${DEFAULT}"
isProd && PROMPT_COLOR="${YELLOW}"
PROMPT2="${PROMPT_COLOR}> ${DEFAULT}"
RPROMPT="${GREEN}%U[%1v%${MAX_RDISPLAY}<...<%/]%u${DEFAULT}"
function terminal_title() {
  print -Pn "\e]2;[%m:%~] %n \a"
}
