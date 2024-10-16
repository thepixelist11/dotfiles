#!/bin/bash

colors_json=~/.cache/wal/colors.json

color0=$(jq -r '.colors.color0' $colors_json)
color1=$(jq -r '.colors.color1' $colors_json)
color2=$(jq -r '.colors.color2' $colors_json)
color3=$(jq -r '.colors.color3' $colors_json)
color4=$(jq -r '.colors.color4' $colors_json)
color5=$(jq -r '.colors.color5' $colors_json)
color6=$(jq -r '.colors.color6' $colors_json)
color7=$(jq -r '.colors.color7' $colors_json)
color8=$(jq -r '.colors.color8' $colors_json)
color9=$(jq -r '.colors.color9' $colors_json)
color10=$(jq -r '.colors.color10' $colors_json)
color11=$(jq -r '.colors.color11' $colors_json)
color12=$(jq -r '.colors.color12' $colors_json)
color13=$(jq -r '.colors.color13' $colors_json)
color14=$(jq -r '.colors.color14' $colors_json)
color15=$(jq -r '.colors.color15' $colors_json)

starship_toml=~/.config/starship.toml

cat <<eof > $starship_toml
format = """
[▒▓]($color5)\\
[ 󰣇  ](bg:$color5 fg:#212121)\\
[](bg:$color4 fg:$color5)\\
\$directory\\
[](fg:$color4 bg:$color1)\\
\$git_branch\\
\$git_status\\
[](fg:$color1 bg:#212121)\\
\$nodejs\\
\$golang\\
\$php\\
\$c\\
\$cmake\\
\$lua\\
\$python\\
[](fg:#212121 bg:#111111)\\
\$time\\
\$memory_usage\\
[ ](fg:#111111)\\
\n\$status \$character"""

[character]
success_symbol = "[>](fg:$color3)"
error_symbol = "[>](fg:#f07178)"

[directory]
style = "fg:$color15 bg:$color4"
format = "[ \$path ](\$style)"
truncation_length = 5
truncation_symbol = "…/"

[git_branch]
symbol = ""
style = "bg:#82aaff"
format = '[[ \$symbol \$branch ](fg:$color15 bg:$color1)](\$style)'

[git_status]
style = "bg:$color1"
format = '[[(\$all_status\$ahead_behind )](fg:$color15 bg:$color1)](\$style)'

[nodejs]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[rust]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[golang]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[php]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[c]
symbol = "c"
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[lua]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[python]
symbol = ""
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[cmake]
symbol = "△"
style = "bg:#212121"
format = '[[ \$symbol (\$version) ](fg:#769ff0 bg:#212121)](\$style)'

[time]
disabled = false
time_format = "%I:%M%p" # hour:minute format
use_12hr = true
style = "bg:#1d2230"
format = '[[  \$time ](fg:#a0a9cb bg:#111111)](\$style)'
eof

