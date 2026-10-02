alias cp 'cp -i'
alias mv 'mv -i'
alias rm trash-put
alias rmls trash-list
alias rmd 'trash-put -rf'

alias vim nvim
alias v 'nvim .'
alias cat bat

alias l 'eza -hl --color=auto --group-directories-first'
alias ls 'eza -ha --color=auto --group-directories-first'
alias ll 'eza -hal --color=auto --group-directories-first'
alias lt 'eza --tree -hal --color=auto --group-directories-first'

alias grep 'grep --color=auto'
alias du 'dust -r'
alias tree "tree --dirsfirst -a -I '.git' -I 'node_modules' -C"

alias weather 'curl -sS wttr.in'
alias define sdcv
alias lsblk 'lsblk -f'

abbr --add --position command cd z

alias c qalc
alias clock 'tty-clock -s -c -t -C 3'

alias g++20 'g++ -std=c++20 -fmodules-ts -Wall -g'
alias g++20h 'g++ -std=c++20 -fmodules-ts -c -x c++-system-header'

alias off 'systemctl poweroff'
alias x exit
alias q exit
alias :q exit
alias pow 'cat /sys/class/power_supply/BAT1/capacity'

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'

alias dots 'nvim ~/dotfiles/'
alias kittyconf 'nvim ~/.config/kitty/kitty.conf'
alias hyprconf 'nvim ~/.config/hypr'

alias gs 'git status'
alias ga 'git add .'
alias gpom 'git push origin main'
alias gl 'git log --pretty=format:"%h %an <%ae> %ad %s" --date=short'

function r
    source "$__fish_config_dir/config.fish"
    clear
    fastfetch
end

alias op 'hyprctl dispatch -- exec'

alias n_warn 'hyprctl notify 0 5000 0'
alias n_info 'hyprctl notify 1 5000 0'
alias n_hint 'hyprctl notify 2 5000 0'
alias n_error 'hyprctl notify 3 5000 0'
alias n_confused 'hyprctl notify 4 5000 0'
alias n_ok 'hyprctl notify 5 5000 0'

alias np 'nix search nixpkgs'

alias m1 'man 1'
alias m2 'man 2'
alias m3 'man 3'
alias m4 'man 4'
alias m5 'man 5'
alias m6 'man 6'
alias m7 'man 7'
alias m8 'man 8'
alias m9 'man 9'

function extract
    for f in $argv
        if not test -f "$f"
            echo "'$f' is not a valid file"
            continue
        end

        switch "$f"
            case '*.tar.bz2'
                tar xvjf "$f"
            case '*.tar.gz'
                tar xvzf "$f"
            case '*.bz2'
                bunzip2 "$f"
            case '*.rar'
                unrar x "$f"
            case '*.gz'
                gunzip "$f"
            case '*.tar'
                tar xvf "$f"
            case '*.tbz2'
                tar xvjf "$f"
            case '*.tgz'
                tar xvzf "$f"
            case '*.zip'
                unzip "$f"
            case '*.Z'
                uncompress "$f"
            case '*.7z'
                7z x "$f"
            case '*'
                echo "Cannot extract '$f'"
        end
    end
end

function open
    if test (count $argv) -ne 1
        echo 'usage: open FILE' >&2
        return 2
    end

    set -l file $argv[1]

    if not test -e "$file"
        echo "open: no such file: $file" >&2
        return 1
    end

    set -l file (realpath -- "$file")
    set -l mime (file --brief --mime-type -- "$file")
    set -l escaped (string escape -- "$file")

    switch "$mime"
        case application/pdf
            hyprctl dispatch "hl.dsp.exec_cmd(\"zathura $escaped\")"

        case 'image/*'
            hyprctl dispatch "hl.dsp.exec_cmd(\"qimgv $escaped\")"

        case 'video/*' 'audio/*'
            hyprctl dispatch "hl.dsp.exec_cmd(\"mpv $escaped\")"

        case 'text/*' 'application/*'
            hyprctl dispatch "hl.dsp.exec_cmd(\"kitty nvim -- $escaped\")"

        case '*'
            hyprctl dispatch "hl.dsp.exec_cmd(\"xdg-open $escaped\")"
    end
end

function mkdirg
    if test (count $argv) -ne 1
        echo 'usage: mkdirg DIRECTORY' >&2
        return 2
    end

    mkdir "$argv[1]" && cd "$argv[1]"
end

function whatismyip
    printf 'Internal IP: '
    ip addr show wlan0 |
        grep 'inet ' |
        awk '{print $2}' |
        cut -d/ -f1

    printf 'External IP: '
    curl -s ifconfig.me
    echo
end
