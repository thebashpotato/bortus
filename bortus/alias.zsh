#
# XXX : All aliases/abbreviations here
#

# System
alias e="$EDITOR"
alias q='exit'
alias b='cd .. && ls'
alias cp='cp -rv'
alias mv='mv -v'
alias rm='rm -rf'
alias srm='sudo rm -rf'
alias h='htop'
alias fix-permissions='sudo chown -R $USER:$USER ~/.config ~/.local'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias df='df -h'
alias userlist='cut -d: -f1 /etc/passwd | sort'
alias psa='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias update-fc='sudo fc-cache -fv'
alias hw='hwinfo --short'
alias jctl='journalctl -p 3 -xb'
alias probe='sudo -E hw-probe -all -upload'

# systemd commands
if has systemctl; then
  alias running_services='systemctl list-units --type=service --state=running'
  alias failed_services='systemctl list-units --type=service --state=failed'
  alias shutdown='systemctl poweroff -i'
  alias reboot='systemctl reboot -i'
  alias sysfailed='systemctl list-units --failed'
fi

# rust replacement programs

if has tree-rs; then
  alias tree='tree-rs'
fi

if has exa; then
  alias l='exa --sort=modified --color=always --color-scale --icons'
  alias ls='exa --sort=modified --color=always --color-scale --icons'
  alias sl='exa --sort=modified --color=always --color-scale --icons'
  alias la='exa -Ghag --sort=modified --color=always --color-scale --git --icons'
  alias lal='exa -Ghalg --sort=modified --color=always --color-scale --git --icons'
  alias ll='exa -Ghag --sort=modified --color=always --color-scale --git --icons'
else
  alias l='ls --color=auto'
  alias ls='ls --color=auto'
  alias sl='ls --color=auto'
  alias la='ls -a'
  alias lal='ls -al'
  alias ll='ls -alFh'
fi

if has bat; then
  alias cat='bat'
fi

# Search content with ripgrep
if has rg; then
  alias rg='rg --sort path'
fi

# Git commands
if has git; then
  alias gs='git status'
  alias gp='git push'
  alias gpr='git push --set-upstream-origin'
  alias gc='git commit -m'
  alias gd='git diff | bat'
  alias gl='git log --oneline --graph'
fi

# Docker commands
if has docker; then
  alias dil="docker image ls"
  alias dcl="docker container ls --all"
fi

if has lolcat && has sparklines; then
  alias c='clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat'
else
  alias c='clear'
fi

# Pacman/Paru aliases
if has pacman; then
  alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
  alias udpate='sudo pacman -Syyu'
  alias pacman='sudo pacman --color auto'
  alias update='sudo pacman -Syyu'
  alias upate='sudo pacman -Syyu'
  alias updte='sudo pacman -Syyu'
  alias updqte='sudo pacman -Syyu'
  alias upqll='paru -Syu --noconfirm && flatpak update -y'
  alias upal='paru -Syu --noconfirm'
  alias pksyua='paru -Syu --noconfirm'
  alias upall='paru -Syu --noconfirm'
  alias paruskip='paru -S --mflags --skipinteg'
  alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
  alias mirrord='sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist'
  alias mirrors='sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist'
  alias mirrora='sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist'
  alias npacman='sudo $EDITOR /etc/pacman.conf'
  alias nmirrorlist='sudo $EDITOR /etc/pacman.d/mirrorlist'
  alias downgrada='sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/'
  alias ngnupgconf='sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf'
  alias fix-keyserver='[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done''
fi

# Grub commands
if has grub-mkconfig; then
  # grub update
  alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
  # grub issue 08/2022
  alias install-grub-efi='sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi'
  alias ngrub='sudo $EDITOR /etc/default/grub'
  alias nconfgrub='sudo $EDITOR /boot/grub/grub.cfg'
fi

# Know what you do in these files, and with these aliases
alias nmkinitcpio='sudo $EDITOR /etc/mkinitcpio.conf'
alias nsddm='sudo $EDITOR /etc/sddm.conf'
alias nsddmk='sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf'
alias nfstab='sudo $EDITOR /etc/fstab'
alias nhosts='sudo $EDITOR /etc/hosts'
alias nhostname='sudo $EDITOR /etc/hostname'
alias nb='$EDITOR ~/.bashrc'
alias nz='$EDITOR ~/.zshrc'
alias nneofetch='$EDITOR ~/.config/neofetch/config.conf'

# Gpg verify signature for isos
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'
alias fix-gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'

# Receive the key of a developer
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'
alias fix-gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'

# Maintenance
alias big='expac -H M '%m\t%n' | sort -h | nl'

# Audio check pulseaudio or pipewire
alias audio='pactl info | grep 'Server Name''

# Check vulnerabilities in microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
