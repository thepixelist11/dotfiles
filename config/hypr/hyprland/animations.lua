-- Curves
hl.curve("wind", {
	type = "bezier",
	points = {
		{ 0.05, 0.9 },
		{ 0.1, 1.05 },
	},
})

hl.curve("winIn", {
	type = "bezier",
	points = {
		{ 0.1, 1.1 },
		{ 0.1, 1.1 },
	},
})

hl.curve("winOut", {
	type = "bezier",
	points = {
		{ 1.3, 1 },
		{ 0, 1 },
	},
})

hl.curve("liner", {
	type = "bezier",
	points = {
		{ 1, 1 },
		{ 1, 1 },
	},
})

hl.curve("overshoot", {
	type = "bezier",
	points = {
		{ 0.05, 0.9 },
		{ 0.1, 1.1 },
	},
})

-- Animations
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 5,
	bezier = "wind",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 5,
	bezier = "overshoot",
})

hl.animation({
	leaf = "borderangle",
	enabled = true,
	speed = 5,
	bezier = "default",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 5,
	bezier = "default",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 5,
	bezier = "default",
})

hl.animation({
	leaf = "windowsMove",
	enabled = true,
	speed = 5,
	bezier = "wind",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 5,
	bezier = "default",
})

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 4,
	bezier = "default",
	style = "slidefade 20%",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 4,
	bezier = "default",
	style = "slidefade 20%",
})
