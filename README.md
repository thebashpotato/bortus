# bortus

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

A zsh shell micro-framework. Created to be simple and hackable,
with a focus on being as close to the fish shell as possible.

## Table of Contents

- [Install](#install)
- [Hacking](#hacking)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Install

1. Symlink method

- Clone and update submodules

```bash
# ssh
git clone --recursive git@github.com:thebashpotato/bortus.git

# https
git clone --recursive https://github.com/thebashpotato/bortus.git


# update submodules
cd bortus && git submodule update --init --recursive
```

- Create soft links

```bash
ln -s $(pwd)/bortus ~/.config/bortus

# Add the following to your .zshrc after you back up your old one.
mv -v ~/.zshrc ~/.zshrc.bak && touch ~/.zshrc
echo "[[ -f ~/.config/bortus/load.zsh ]] && source ~/.config/bortus/load.zsh" >> ~/.zshrc
```

2. install.sh (TODO)

- TODO

## Hacking

Configuring `bortus` is simple and self explanatory. [This file is used for variables](./bortus/bortus_config.zsh)

```bash
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
```

## Maintainers

[@thebashpotato](https://gitlab.com/thebashpotato)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2023 Matt Williams
