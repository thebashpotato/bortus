#
# XXX: Helper functions.
#

# NOTE: POSIX color variables
BOLD="$(tput bold 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"

# Public: Info logging function
function info() {
  printf '%s\n' "${BLUE}${BOLD}>${NO_COLOR} $*"
}

# Public: Warning logging function
function warn() {
  printf '%s\n' "${YELLOW}! $*${NO_COLOR}"
}

# Public: Error logging function
function error() {
  printf '%s\n' "${RED}x $*${NO_COLOR}" >&2
}

# Public: Completion logging function
function completed() {
  printf '%s\n' "${GREEN}${BOLD}✓${NO_COLOR}${BOLD} $*${NO_COLOR}"
}

# Public: Sources the poky linux container.
# Accpets t | r as an argument.
# WARN: This is for my job, feel free to delete it.
function load_poky_env() {
  local _series="$1"
  if [[ -z "$_series" ]]; then
    error "Empty argument, r or t is accepted"
    return
  fi
  local tseries_sdk="/opt/poky/4.0.4/environment-setup-cortexa9t2hf-neon-poky-linux-gnueabi"
  local rseries_sdk=""

  case "$_series" in
  t)
    if [[ -f $tseries_sdk ]]; then
      if [[ ":$PATH:" != *":/opt/poky/4.0.4/sysroots/x86_64-pokysdk-linux/usr/bin:"* ]]; then
        source $tseries_sdk
        completed "T-series development SDK loaded successfully"
      else
        warn "T-series development SDK is already loaded.."
      fi
    else
      error "$tseries_sdk => T-series development SDK not found.."
    fi
    ;;
  r)
    if [[ -f $rseries_sdk ]]; then
      source $rseries_sdk
      completed "R-series development SDK environment loaded successfully"
    else
      error "$rseries_sdk => R-series development SDK not found.."
    fi
    ;;
  *)
    error "[$_series] is an invalid type. r or t is accepted"
    ;;
  esac
}

# Public: POSIX compliant convenience function
# to tell us whether a program is installed or not.
function has() {
  local _program="$1"
  [[ -z "$_program" ]] && return
  command -v "$_program" 1>/dev/null 2>&1
}

# Public: Only adds a new path to the $PATH env variable
# if it exists.
# Automatically appends the $PATH var to the end of the $1 argument.
function bortus_add_to_path_if_exists() {
  local _path="$1"
  [[ -z "$_path" ]] && return
  [[ -d "$_path" ]] && PATH="$_path:$PATH"
}

# Public: Change the ownership and group recursively for a resource.
function ownership() {
  local _resource="$1"
  [[ -z "$_resource" ]] && return
  sudo chown -R "$USER" "$_resource" && sudo chgrp -R "$USER" "$_resource"
}

# Public: Extracts various compressed file types.
function ex() {
  local _file="$1"
  [[ -z "$_file" ]] && error "Empty argument" && return 1
  if [[ -f "$_file" ]]; then
    case "$_file" in
    *.tar.bz2) tar xjfv "$_file" ;;
    *.tar.gz) tar xzfv "$_file" ;;
    *.bz2) bunzip2 "$_file" ;;
    *.rar) unrar x "$_file" ;;
    *.gz) gunzip "$_file" ;;
    *.tar) tar xf "$_file" ;;
    *.tbz2) tar xjf "$_file" ;;
    *.tgz) tar xzf "$_file" ;;
    *.zip) unzip "$_file" ;;
    *.Z) uncompress "$_file" ;;
    *.7z) 7z x "$_file" ;;
    *.deb) ar x "$_file" ;;
    *.tar.xz) tar xfv "$_file" ;;
    *.tar.zst) tar xfv "$_file" ;;
    *) warn "'$_file' cannot be extracted via ex()" ;;
    esac
  else
    error "'$_file' is not a valid file"
  fi
}
