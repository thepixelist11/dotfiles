-- Monitors

hl.monitor({
	output = "*",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.monitor({
	output = "eDP-2",
	mode = "2560x1600@240",
	position = "0x1380",
	scale = 1.333333,
})

hl.monitor({
	output = "DP-1",
	mode = "3440x1440@143.964996",
	position = "1925x990",
	scale = 1.0,
})

hl.monitor({
	output = "DP-2",
	mode = "1920x1080@140",
	position = "5365x980",
	scale = 1,
	transform = 3,
	vrr = 0,
	bitdepth = 8,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@144",
	position = "5365x980",
	scale = 1,
	transform = 3,
	vrr = 0,
	bitdepth = 8,
})

-- Workspaces

hl.workspace_rule({
	workspace = "1",
	persistent = true,
	monitor = "eDP-2",
})

hl.workspace_rule({
	workspace = "2",
	persistent = true,
	monitor = "DP-5",
	default = true,
})

hl.workspace_rule({
	workspace = "3",
	persistent = true,
	monitor = "HDMI-A-1",
})
