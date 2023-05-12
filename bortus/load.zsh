#
# XXX: Initializes the bortus zsh-micro-framework
#

# NOTE: If not running interactively, don't do anything
[[ $- != *i* ]] && return

# NOTE: Set bortus home dir
BORTUS_HOME_DIR="$HOME/.config/bortus"

# NOTE: Modules that need to be loaded
# in order for bortus to work
bortus_modules=(
  "$BORTUS_HOME_DIR/config.zsh" # Always load first
  "$BORTUS_HOME_DIR/functions.zsh"
  "$BORTUS_HOME_DIR/shell_settings.zsh"
  "$BORTUS_HOME_DIR/alias.zsh"
  "$BORTUS_HOME_DIR/history.zsh"
  "$BORTUS_HOME_DIR/completion.zsh"
  "$BORTUS_HOME_DIR/prompts/load.zsh"
  "$BORTUS_HOME_DIR/plugins/load.zsh"   # Always load second to last
  "$BORTUS_HOME_DIR/reporting_tool.zsh" # Always load last
)

for module in "${bortus_modules[@]}"; do
  [[ -f "$module" ]] && source "$module"
done
