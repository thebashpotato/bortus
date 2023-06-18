function __load_default_prompt() {
  source "$BORTUS_PROMPT_DIR/default.zsh"
}

case "$BORTUS_PROMPT" in
default || "" || " ")
  __load_default_prompt
  ;;
starship)
  if has starship && [ "$SHLVL" -eq 1 ]; then
    eval "$(starship init zsh)"
  else
    warn "'starship' not found"
    __load_default_prompt
  fi
  ;;
oh-my-posh)
  if has oh-my-posh && [ "$SHLVL" -eq 1 ]; then
    eval "$(oh-my-posh init zsh)"
  else
    warn "'oh-my-posh' not found"
    __load_default_prompt
  fi
  ;;
*)
  warn "'$BORTUS_PROMPT' is not a supported prompt name or framework"
  __load_default_prompt
  ;;
esac
