case "$BORTUS_PROMPT" in
default)
  source "$BORTUS_PROMPT_DIR/default.zsh"
  ;;
starship)
  if has starship && [[ "$SHLVL" -eq 1 ]]; then
    eval "$(starship init zsh)"
  else
    source "$BORTUS_PROMPT_DIR/default.zsh"
  fi
  ;;
*)
  source "$BORTUS_PROMPT_DIR/default.zsh"
  ;;
esac
