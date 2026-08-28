#
#
#    ______ _____ _    _   _____   _____
#   |___  // ____| |  | | |  __ \ / ____|
#      / /| (___ | |__| | | |__) | |
#     / /  \___ \|  __  | |  _  /| |
#    / /__ ____) | |  | | | | \ \| |____
#   /_____|_____/|_|  |_| |_|  \_\\_____|
#
#           Created by Ben N.
#
#
#
# =============================
#      Software Required
# =============================
#
# Shell & prompt:
#   zsh, zsh-completions, zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k, nerd-fonts
#
# Editors & terminal utilities:
#   neovim, kitty, less, bat, eza, dust, tree, tty-clock, fastfetch, trash-cli
#
# Shell enhancements:
#   zoxide
#
# Programming Languages & runtimes:
#   nodejs, npm, nvm, deno, rust (cargo), cuda toolkit, nvidia drivers,
#   miniconda, opam, ghc, ghcup
#
# Version control & Networking:
#   git, curl, iproute2
#
# Archiving:
#   tar, gzip, bzip2, unzip, unrar, p7zip, ncompress
#
# VPN:
#   wg-quick
#
# Utils:
#   grep, sdcv
#
# System:
#   systemd, flatpak
#

# ====================================================================================

# Set up direnv before p10k
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Exit early if not interactive
[[ -o interactive ]] || return

# Enable direnv hook.
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

# =============================
# PATHS & ENVIRONMENT
# =============================

# Prepend local bins
export PATH="$HOME/.volta/bin:$PATH"

# CUDA / NVIDIA
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
export LIBGL_DRIVERS_PATH="/usr/lib/nvidia"

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS SHARE_HISTORY INC_APPEND_HISTORY

# Pager/editor
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

# Don't beep
setopt NO_BEEP

# Use colors in ls/grep/etc
autoload -Uz colors && colors

# zsh-completions
autoload -Uz compinit && compinit -C

# Enable command auto-correction and menu selection
setopt CORRECT
zstyle ':completion:*' menu select

# Ignore case on completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Show completion automatically after typing
setopt AUTO_LIST

# Include hidden files in globbing
setopt GLOBDOTS

# =============================
# PROMPT & SHELL ENHANCEMENTS
# =============================

# zoxide (fast `cd` alternative)
eval "$(zoxide init zsh)"

# Source ble.sh (optional - can be slow)
# source ~/ble.sh/out/ble.sh --noattach
# [[ ${BLE_VERSION-} ]] && ble-attach

# =============================
# LAZY LOADERS
# =============================

# Lazy-load NVM
# nvm() {
#   unset -f nvm
#   export NVM_DIR="$HOME/.nvm"
#   [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
#   nvm "$@"
# }

# Lazy-load Homebrew
brew() {
  unset -f brew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  brew "$@"
}

# Load Deno
[[ -f "$HOME/.deno/env" ]] && source "$HOME/.deno/env"

# Run Fastfetch if the terminal is large enough
# if [[ $(tput lines) -ge 40 ]]; then
# 	if [[ $(tput cols) -ge 80 ]]; then
# 		fastfetch
# 	fi
# fi

# =============================
# CUSTOM ALIASES & FUNCTIONS
# =============================

# Safe file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash-put'
alias rmls='trash-list'
alias rmd='trash-put -rf'

# Tools
alias vim='nvim'
alias nvg='nvim --listen /tmp/godot.pipe'
alias v='nvim .'
alias cat='bat'
alias ls='eza -ha --color=auto --group-directories-first'
alias ll='eza -hal --color=auto --group-directories-first'
alias lt='eza --tree -hal --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias du='dust -r'
alias tree="tree --dirsfirst -a -I '.git' -I 'node_modules' -C"
alias weather='curl -sS wttr.in'
alias define='sdcv'
alias f='fuck'
alias lsblk='lsblk -f'
alias cd='z'
alias c='qalc'
alias clock='tty-clock -s -c -t -C 3'

# Quick system commands
alias off='systemctl poweroff'
alias x='exit'
alias q='exit'
alias :q='exit'

# Directory jumps
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dots='nvim ~/dotfiles/'
alias notes='cd ~/Documents/School/University/1B/ && nvim ~/Documents/School/University/1B'
alias zshrc='nvim ~/.zshrc'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias hyprconf='nvim ~/.config/hypr'

# Git
alias gs='git status'
alias ga='git add .'
alias gpom='git push origin main'
alias gl='git log --pretty=format:"%h %an %ad %s" --date=short'

# Reload shell
alias r='source ~/.zshrc && clear && fastfetch'

# Kitty themes
alias kt_default='kitten themes Default'
alias kt_pywal='kitten themes Pywal'

# Open via Hyprland
alias op='hyprctl dispatch -- exec'

# Nix
alias np='nix search nixpkgs'

# Hyprland Notifications
alias n_warn='hyprctl notify 0 5000 0'
alias n_info='hyprctl notify 1 5000 0'
alias n_hint='hyprctl notify 2 5000 0'
alias n_error='hyprctl notify 3 5000 0'
alias n_confused='hyprctl notify 4 5000 0'
alias n_ok='hyprctl notify 5 5000 0'

# Man Pages
alias m1='man 1' # Executable programs or shell commands
alias m2='man 2' # System calls
alias m3='man 3' # Library calls
alias m4='man 4' # Special files
alias m5='man 5' # File formats
alias m6='man 6' # Games
alias m7='man 7' # Misc
alias m8='man 8' # System administration commands
alias m9='man 9' # Kernel routines

# =============================
# FUNCTIONS
# =============================

# Extract various archive formats
extract() {
  for f in "$@"; do
    if [[ -f "$f" ]]; then
      case "$f" in
        *.tar.bz2) tar xvjf "$f" ;;
        *.tar.gz) tar xvzf "$f" ;;
        *.bz2) bunzip2 "$f" ;;
        *.rar) unrar x "$f" ;;
        *.gz) gunzip "$f" ;;
        *.tar) tar xvf "$f" ;;
        *.tbz2) tar xvjf "$f" ;;
        *.tgz) tar xvzf "$f" ;;
        *.zip) unzip "$f" ;;
        *.Z) uncompress "$f" ;;
        *.7z) 7z x "$f" ;;
        *) echo "Cannot extract '$f'" ;;
      esac
    else
      echo "'$f' is not a valid file"
    fi
  done
}

mkdirg() {
  mkdir $1
  cd $1
}

# Go up N directories
up() {
  local d=""
  for ((i=1; i<=$1; i++)); do d+="../"; done
  cd "$d"
}

# Print local & public IP
whatismyip() {
  echo -n "Internal IP: "
  ip a show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1
  echo -n "External IP: "
  curl -s ifconfig.me
}

# Sourcing secrets
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# Sourcing plugins and themes
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
