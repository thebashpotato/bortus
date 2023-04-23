#
# XXX: Sources/loads all plugins
#

# Simple function to load plugins that do not require configuration after loading
function __bortus_load_plugin() {
  local _plugin="$BORTUS_PLUGIN_DIR/$1"
  if [[ -f "$_plugin" ]]; then
    source "$_plugin"
    [ "$?" -ne 0 ] && warn "Failed to load plugin: [$_plugin]"
  else
    warn "Plugin: [ $_plugin ] does not exist"
  fi
}

# Set up and confgure plugins
__bortus_load_plugin "zsh-autosuggestions/zsh-autosuggestions.zsh"
__bortus_load_plugin "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
__bortus_load_plugin "fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh"
__bortus_load_plugin "zsh-history-substring-search/zsh-history-substring-search.zsh"
fpath=("$BORTUS_PLUGIN_DIR/zsh-completions/src" $fpath)
