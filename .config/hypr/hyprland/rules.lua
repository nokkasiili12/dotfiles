local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	match = { title = "floating-center" },

	float = true,
	center = true,
	border_size = 1,
	size = { "(monitor_w*0.45)", "(monitor_h*0.55)" },
})

hl.window_rule({
	name = "spotify",
	match = { title = "spotify" },

	float = true,
	center = true,
	border_size = 1,
	size = { "(monitor_w*0.45)", "(monitor_h*0.55)" },
})

hl.window_rule({
	match = { class = "^(firefox)$" },
	opacity = "1.0 override 0.96 override",
})

hl.layer_rule({ match = { namespace = "swayosd" }, animation = "slide" })
