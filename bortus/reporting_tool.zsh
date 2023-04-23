#
# XXX: Loads a given terminal screen reporting tool,
# iff the var is not empty,
# and if the program is installed on the system,
# and if the shell level is equal to 1,
#

if [[ ! -z "$BORTUS_REPORTING_TOOL" ]] &&
  has "$BORTUS_REPORTING_TOOL" &&
  [[ "$SHLVL" -eq 1 ]]; then
  $BORTUS_REPORTING_TOOL
fi
