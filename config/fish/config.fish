set fish_greeting ""

source ~/.config/fish/env.fish

if status is-interactive
    fish_vi_key_bindings
    fish_vi_cursor

    source ~/.config/fish/aliases.fish

    if command -v zoxide >/dev/null
        zoxide init fish | source
    end
end
