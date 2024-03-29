function __load_default_prompt() {
  source "$BORTUS_PROMPT_DIR/default.zsh"
}

case "$BORTUS_PROMPT" in
default || "" || " ")
  __load_default_prompt
  ;;
starship)
  if has starship; then
    eval "$(starship init zsh)"
  else
    __load_default_prompt
  fi
  ;;
oh-my-posh)
  if has oh-my-posh; then
    if [ -z "$BORTUS_OH_MY_POSH_THEME" ]; then
      eval "$(oh-my-posh init zsh)"
    else
      eval "$(oh-my-posh init zsh --config $BORTUS_OH_MY_POSH_THEME)"
    fi

  else
    __load_default_prompt
  fi
  ;;
*)
  warn "'$BORTUS_PROMPT' is not a supported prompt name or framework"
  __load_default_prompt
  ;;
esac
