-- Opacity rules
hl.window_rule({ match = { title = "(.*Developer Tools.*)" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "(.*org.pwmt.zathura.*)" }, opacity = "0.75 0.75" })
hl.window_rule({ match = { class = "(.*evince.*)" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { title = "(.*Thunar.*)" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "(steam)" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "(libreoffice-writer)" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { title = "Qalculate!" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { title = "Spotube" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "(KeePassXC)" }, opacity = "0.93 0.93" })
hl.window_rule({ match = { class = "(com.github.johnfactotum.Foliate)" }, opacity = "0.7 0.7" })

-- xwaylandvideobridge
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, opacity = "1.0 override" })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_anim = true })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_initial_focus = true })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, max_size = { 1, 1 } })
hl.window_rule({ match = { class = "^(xwaylandvideobridge)$" }, no_blur = true })

-- Blur
hl.window_rule({ match = { class = "(zen)" }, no_blur = true })

-- Fullscreen / maximize
hl.window_rule({ match = { class = "libreoffice-impress" }, fullscreen = true })
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ match = { title = "^(Godot)$" }, maximize = true })

-- Godot debug windows
hl.window_rule({
	name = "godot-debug-main",
	match = {
		class = "^(Godot)$",
		title = "^(.*DEBUG.*)$",
	},
	workspace = "1",
})

hl.window_rule({
	name = "godot-debug-game",
	match = {
		class = "^(dodge-the-creeps-tutorial)$",
		title = "^(.*DEBUG.*)$",
	},
	workspace = "1",
})

-- Games
hl.window_rule({ match = { title = "^(.*Terraria.*)$" }, fullscreen = true })
hl.window_rule({ match = { class = "^(nuclearthroneultramod.exe)$" }, maximize = true })

-- Floating windows
hl.window_rule({ match = { title = "^(LaTeX OCR)$" }, float = true })
hl.window_rule({ match = { title = "(Waypaper)" }, float = true })
hl.window_rule({ match = { title = "Qalculate!" }, float = true })
hl.window_rule({ match = { title = "(Gnuplot.*)" }, float = true })
hl.window_rule({ match = { title = "(.*Thunar)" }, float = true, size = { 900, 700 } })
hl.window_rule({ match = { class = "io.github.supersonic-app.supersonic" }, float = true, size = { 900, 700 } })
hl.window_rule({ match = { title = "(clock)" }, float = true })

-- Walker
hl.window_rule({
	match = { class = "(dev.benz.walker)" },
	size = { 516, 500 },
})

hl.window_rule({
	match = { class = "(dev.benz.walker)" },
	float = true,
})

-- Empty title/class windows
hl.window_rule({ match = { title = "^()$" }, no_blur = true })
hl.window_rule({ match = { class = "^()$" }, no_blur = true })
