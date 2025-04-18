#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source ble.sh
[[ $- == *i* ]] && source ~/ble.sh/out/ble.sh --noattach

iatest=$(expr index "$-" i)

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

export NVM_DIR="$HOME/.nvm"

# NVM is slow to start up
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="/home/ben/.local/bin:$PATH"

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=10000

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Setup NVIDIA GPU
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
export LIBGL_DRIVERS_PATH=/usr/lib/nvidia
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# Add npm globals to path
export PATH=~/.npm-global/bin:$PATH

# Set pager to moar
# export PAGER=/usr/bin/moar

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
alias cat='bat'

# Init starship
eval "$(starship init bash)"

# Starship transient prompt
bleopt prompt_ps1_final='$(starship module character)'

# Run fastfetch if the terminal is large enough
if [[ $(tput lines) -ge 40 ]]; then
	if [[ $(tput cols) -ge 80 ]]; then
		fastfetch
	fi
fi

#######################################################
# CUSTOM SCRIPT ALIAS'S
#######################################################

alias rma='~/scripts/rma.sh'

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we precede the command with a \


# Bash with no profile
alias bashc='bash --noprofile --norc'

# Poweroff
alias off='systemctl poweroff'

# lsblk show more info
alias lsblk='lsblk -f'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias less='less -R'
alias cmatrix='cmatrix -bs -C yellow'
alias clock='tty-clock -s -c -t -C 3'
alias cls='clear'
alias onefetch='onefetch --number-of-file-churns 0 --no-color-palette --exclude docs dist build'
alias cal='cal -y'

# Files
alias f='fuck'

# Use nvim for man pages
man() {
  /usr/bin/man $* | \
    col -b | \
    nvim -R -c 'set ft=man nomod nolist' -
}

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Search command line history
alias h="history | grep "

# Calculator
alias c='kalc --line=true --siunits=false --color=false'
alias calc='kalc --line=true --siunits=false --color=false'
alias kalc='kalc --line=true --siunits=false --color=false'

# File tree
alias tree="tree --dirsfirst -a --gitignore -I '.git' -C"

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Weather
alias weather='curl -sS wttr.in'

# Dictionary
alias define='sdcv'

# wl-copy alias
alias clipboard='wl-copy'

# Exit aliases
alias x='exit'
alias q='exit'
alias :q='exit'

# Steam with args
alias steam='steam --enable-features=UseOzonePlatform --ozone-platform=wayland'

# Grep
alias grep='grep --color=auto'

# Disk usage
alias du='dust -r'

# Neofetch=fastfetch
alias neofetch='fastfetch'

# Ranger alias
alias rc='ranger'

# Move process to bg after ctrl-z
alias gotobg='bg && disown'

# Common files/directories
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.config/nvim'
alias starshiprc='nvim ~/.config/starship.toml'
alias hyprconf='nvim ~/.config/hypr'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias win='cd /run/media/ben/Windows-SSD/'
alias docs='nvim ~/Documents/'
alias dots='nvim ~/dotfiles/'
alias notes='cd ~/notes ; nvim ~/notes/home.md'
alias chars='nvim dotfiles/.config/wofi/characters'

# Open in default apps
alias sudoedit='sudo -E nvim'
alias pdf='evince'
alias term='kitty'
alias web='firefox'
alias vid='vlc'
alias video='vlc'
alias music='vlc'
alias edit='kdenlive'

# Open nvim in dir
alias vd='~/scripts/vimdir.sh'
alias v='nvim .'

# Battery
alias pow='upower -d'

# Trash
alias rm='trash-put'
alias rmls='trash-list'
alias rmd='trash-put -rf'

# WiFi
alias gbcguest='echo "5198945513" & nmcli connection up "GBC - Guest" --ask'
alias homewifi='nmcli connection up 144bushclover'

alias wifils='nmcli device wifi'

alias chkwifi='nmcli -p g'

# SSH
alias t520='ssh ben@10.0.0.118'
alias optiplex='ssh -p 2222 ben@benoptiplex.duckdns.org'

# Open new kitty in same directory
alias cpk='~/scripts/cpKitty.sh'

# Initialize typescript project
alias tsinit='~/scripts/tsInit/tsInit.sh'

# List
alias ls='eza -ha --color=auto --group-directories-first'
alias ll='eza -hal --color=auto --group-directories-first'

# Internet Speed Test
alias st='speedtest-cli'

# Git aliases
alias gstat='git status'
alias gadd='git add .'
alias gpom='git push origin main'

# Reload config and terminal
alias r='source ~/.profile ; clear ; fastfetch'

# Kitty themes
alias kt_default='kitten themes Default'
alias kt_pywal='kitten themes Pywal'

#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s) (if unp isn't installed)
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext() {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
		awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d

}

# Automatically do an ls after each cd, z, or zoxide
cd() {
	if [ -n "$1" ]; then
		z "$@"
	else
		z ~
	fi

	# Onefetch on entering git repo
	git rev-parse 2>/dev/null
	if [ $? -eq 0 ]; then
		onefetch 2>/dev/null
	fi

	ls
}

alias z="cd"

# Load NVM
nvm() {
	unset -f nvm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm "$@"
}

# Load homebrew
brew() {
    unset -f brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew "$@"
}

# Returns the last 2 fields of the working directory
# pwd() {
# 	pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
# }

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show wlan0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig wlan0 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
}

# Call command once every 1 second
function repeat() {
	while :
	do
		clear
		$1
		sleep 1
	done
}


# Trim leading and trailing spaces (for scripts)
trim() {
	local var=$*
	var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
	echo -n "$var"
}

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

. "$HOME/.cargo/env"

eval "$(zoxide init bash)"

eval "$(thefuck --alias)"

# Attach ble.sh. Must be at bottom
[[ ${BLE_VERSION-} ]] && ble-attach
. "/home/ben/.deno/env"

