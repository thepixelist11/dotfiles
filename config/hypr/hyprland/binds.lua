local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local email = "thunderbird"
local browser = "zen"
local menu = 'wofi --show drun -i -I -b -a -p " " --conf ~/.config/wofi/wofi.conf --style ~/.config/wofi/style.css'
local screenshot = [[grimblast copysave area "$HOME/Media/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S.png')"]]

-- General

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind("code:202", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(email))

-- Notifications

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t"))

-- Clipboard

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/scripts/cliphist.sh"))

-- LibreOffice

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))

-- Theme

hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("waypaper"))

-- Screenshots

hl.bind("Print", hl.dsp.exec_cmd(screenshot))

-- Focus movement

local directions = {
	{ key = "left", dir = "left" },
	{ key = "right", dir = "right" },
	{ key = "up", dir = "up" },
	{ key = "down", dir = "down" },
	{ key = "H", dir = "left" },
	{ key = "L", dir = "right" },
	{ key = "K", dir = "up" },
	{ key = "J", dir = "down" },
}

for _, v in ipairs(directions) do
	hl.bind(mainMod .. " + " .. v.key, hl.dsp.focus({ direction = v.dir }))
end

-- Resize windows

local resizeSmall = {
	H = { -50, 0 },
	L = { 50, 0 },
	K = { 0, -50 },
	J = { 0, 50 },
	left = { -50, 0 },
	right = { 50, 0 },
	up = { 0, -50 },
	down = { 0, 50 },
}

for key, size in pairs(resizeSmall) do
	hl.bind(
		mainMod .. " + ALT + " .. key,
		hl.dsp.window.resize({ x = size[1], y = size[2], relative = true }),
		{ repeating = true }
	)
end

local resizeLarge = {
	H = { -150, 0 },
	L = { 150, 0 },
	K = { 0, -150 },
	J = { 0, 150 },
	left = { -150, 0 },
	right = { 150, 0 },
	up = { 0, -150 },
	down = { 0, 150 },
}

for key, size in pairs(resizeLarge) do
	hl.bind(
		mainMod .. " + CTRL + " .. key,
		hl.dsp.window.resize({ x = size[1], y = size[2], relative = true }),
		{ repeating = true }
	)
end

-- Move windows

for _, v in ipairs(directions) do
	hl.bind(mainMod .. " + SHIFT + " .. v.key, hl.dsp.window.move({ direction = v.dir }))
end

-- Workspaces

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Center floating window

hl.bind(mainMod .. " + SPACE", function()
	hl.dispatch(hl.dsp.window.float())
	hl.dispatch(hl.dsp.window.resize({ x = 900, y = 600 }))
	hl.dispatch(hl.dsp.window.center())
end)

-- Hyprpicker

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker | tail -n 1 | wl-copy"))

-- Workspace scrolling

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse move/resize

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

-- Media

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Brightness

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/scripts/changeBrightness.sh sub"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/scripts/changeBrightness.sh"), { locked = true })

-- Calculator

hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"))

-- Ashell

hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("/home/ben/scripts/toggleBar.sh"))

-- Lock

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("hyprlock"))

-- Opacity

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("hyprctl setprop active opaque toggle"))

-- Fullscreen

hl.bind(mainMod .. " + D", hl.dsp.window.fullscreen())

-- Xournalpp

hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("xournalpp"))

-- Hyprsunset

hl.bind(mainMod .. " + F5", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"))
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("hyprctl hyprsunset temperature -500"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("hyprctl hyprsunset temperature +500"))

-- Music Player

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("supersonic-desktop"))
