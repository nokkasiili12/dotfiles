hl.monitor({
	output = "",
	mode = "2560x1440@320",
	position = "auto",
	scale = "auto",
})

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,

		col = {
			active_border = "rgba(ffffffff)",
			inactive_border = "rgba(00000000)",
		},

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},
})

hl.config({
	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 0.92,
		inactive_opacity = 0.82,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = -1, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
