#
# XXX: Sets up global bortus env variables only
#

# NOTE: Tooling variables

# BORTUS_PROMPT: Accepted values are (default, starship, oh-my-posh).
# Invalid values will be ignored and the default shell will be loaded
BORTUS_PROMPT="oh-my-posh"

# a using oh-my-posh, set the theme path here
BORTUS_OH_MY_POSH_THEME="$HOME/.cache/oh-my-posh/themes/stelbent.minimal.omp.json"

# BORTUS_REPORTING_TOOL: Accepted values are (neofetch, screenfetch, pfetch, yarsi, etc)
# Basically any terminal fetch tool will be used by name if it is found on the system.
# a you don't want to load a reporting tool then leave the variable empty
BORTUS_REPORTING_TOOL="yarsi"

# NOTE: Path variables

BORTUS_PLUGIN_DIR="$BORTUS_HOME_DIR/plugins"
BORTUS_PROMPT_DIR="$BORTUS_HOME_DIR/prompts"
