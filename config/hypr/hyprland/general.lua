local colors = require("hyprland.colors")

local gaps = false

local gapsIn = 10
local gapsOut = 10
local borderSize = 2
local rounding = 8

local blurSize = 4
local blurPasses = 4

hl.config({
	general = {
		gaps_in = gaps and gapsIn or 0,
		gaps_out = gaps and gapsOut or 0,
		border_size = gaps and borderSize or 0,

		resize_on_border = true,

		col = {
			inactive_border = {
				colors = { colors.color10, colors.color11 },
				angle = 45,
			},

			active_border = colors.color6,
		},

		layout = "dwindle",
		allow_tearing = false,

		snap = {
			enabled = true,
		},
	},

	decoration = {
		rounding = gaps and rounding or 0,
		rounding_power = 4,

		blur = {
			enabled = true,
			xray = true,
			special = false,
			size = blurSize,
			passes = blurPasses,
			brightness = 1,
			noise = 0.01,
			contrast = 1,
			new_optimizations = true,
			ignore_opacity = true,
		},

		shadow = {
			enabled = gaps,
			range = 12,
			render_power = 2,
			offset = { 2, 3 },
			color = "rgba(0, 0, 0, 0.4)",
		},

		dim_inactive = false,
		dim_strength = 0.3,
		dim_special = 0,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		background_color = colors.backgroundCol,
		vrr = 1,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
	},

	input = {
		kb_layout = "us",
		repeat_delay = 200,
		repeat_rate = 25,
		follow_mouse = 1,

		touchpad = {
			natural_scroll = true,
		},

		accel_profile = "adaptive",

		sensitivity = 0,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	cursor = {
		inactive_timeout = 1,
		no_hardware_cursors = true,
		no_break_fs_vrr = 2,
		min_refresh_rate = 144,
		zoom_factor = 0,
		zoom_rigid = false,
		use_cpu_buffer = true,
	},

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},

	opengl = {
		nvidia_anti_flicker = true,
	},
})
