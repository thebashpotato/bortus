#
# XXX: General and Custom ZSH settings are defined here
#

#
# NOTE: General ZSH settings
#

autoload -U colors && colors
autoload -Uz compaudit compinit zrecompile && compinit

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTCONTROL=ignoreboth:erasedups
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='firefox'
export READER='zathura'

# NOTE: Custom ZSH User settings

bortus_add_to_path_if_exists "$HOME/scripts"
bortus_add_to_path_if_exists "$HOME/.local/bin"

# for neovide
export WINIT_UNIX_BACKEND='x11'

# vim sessions directory
export VIM_SESSIONS="$XDG_CONFIG_HOME/vim_sessions"

# CPM package manager cache directory
export CPM_SOURCE_CACHE="$XDG_CACHE_HOME/CPM"

# Rust tool chain
if [[ -d "$HOME/.cargo" ]]; then
  bortus_add_to_path_if_exists "$HOME/.cargo/bin"
  export CARGO_HOME="$HOME/.cargo"
fi

# Nvim nightly build
bortus_add_to_path_if_exists /opt/nvim-linux64/bin

# Node tooling (fast node version manager)
# Install command: curl -fsSL https://fnm.vercel.app/install | bash
if has "$HOME/.local/share/fnm/fnm"; then
  bortus_add_to_path_if_exists "$HOME/.local/share/fnm"
  eval "$(fnm env)"
fi
