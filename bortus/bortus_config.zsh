#
# XXX: Sets up global bortus env variables only
#

# NOTE: Tooling variables

# BORTUS_PROMPT: Accepted values are (default, starship).
# Invalid values will be ignored and the default shell will be loaded
BORTUS_PROMPT="starship"

# BORTUS_REPORTING_TOOL: Accepted values are (neofetch, screenfetch, pfetch, etc)
# Basically any terminal fetch tool will be used by name if it is found on the system.
# If you don't want to load a reporting tool then leave the variable empty
BORTUS_REPORTING_TOOL=""

# NOTE: Path variables

BORTUS_PLUGIN_DIR="$BORTUS_HOME_DIR/plugins"
BORTUS_PROMPT_DIR="$BORTUS_HOME_DIR/prompts"
