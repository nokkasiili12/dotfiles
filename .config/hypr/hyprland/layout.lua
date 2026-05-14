local state = {
	ratio = 0.58,
	offset = 0,
	cycle = 0,
}

local sides = { "left", "top", "right", "bottom" }
local opposite = {
	left = "right",
	right = "left",
	top = "bottom",
	bottom = "top",
}

local function clamp(x, min, max)
	return math.max(min, math.min(max, x))
end

hl.layout.register("spiral", {
	recalculate = function(ctx)
		local n = #ctx.targets
		if n == 0 then
			return
		end

		local area = ctx.area

		for i = 1, n do
			-- rotate window order for cyclenext/cycleprev
			local idx = ((i - 1 + state.cycle) % n) + 1
			local target = ctx.targets[idx]

			if i == n then
				target:place(area)
			else
				local side = sides[((i - 1 + state.offset) % #sides) + 1]
				target:place(ctx:split(area, side, state.ratio))
				area = ctx:split(area, opposite[side], 1.0 - state.ratio)
			end
		end
	end,

	layout_msg = function(ctx, msg)
		local command, arg = msg:match("^(%S+)%s*(.*)$")

		if command == "ratio" then
			state.ratio = clamp(tonumber(arg) or state.ratio, 0.1, 0.9)
		elseif command == "grow" then
			state.ratio = clamp(state.ratio + 0.05, 0.1, 0.9)
		elseif command == "shrink" then
			state.ratio = clamp(state.ratio - 0.05, 0.1, 0.9)
		elseif command == "cyclenext" then
			state.cycle = (state.cycle + 1) % #ctx.targets
		elseif command == "cycleprev" then
			state.cycle = (state.cycle - 1 + #ctx.targets) % #ctx.targets
		else
			return "spiral: expected ratio <0.1..0.9>, grow, shrink, rotate, cyclenext, or cycleprev"
		end

		return true
	end,
})
