-- Swipe to switch workspaces

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})

-- Pinch to zoom

hl.gesture({ fingers = 3, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })

-- Volume + Brightness

local brightness_gesture = function(change)
	if change < 0 then
		hl.exec_cmd("brightnessctl -d intel_backlight set " .. math.abs(change) .. "-%")
	else
		hl.exec_cmd("brightnessctl -d intel_backlight set +" .. math.abs(change) .. "%")
	end
end

local volume_gesture = function(change)
	hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ " .. math.abs(change) .. "%" .. (change < 0 and "-" or "+"))
end

-- hl.gesture({
-- 	fingers = 3,
-- 	direction = "vertical",
-- 	action = {
-- 		start = function(e)
-- 			brightness_gesture(-0.25 * e.delta.y)
-- 		end,
-- 		update = function(e)
-- 			brightness_gesture(-0.25 * e.delta.y)
-- 		end,
-- 	},
-- })
-- 
-- hl.gesture({
-- 	fingers = 4,
-- 	direction = "vertical",
-- 	action = {
-- 		start = function(e)
-- 			volume_gesture(-0.1 * e.delta.y)
-- 		end,
-- 		update = function(e)
-- 			volume_gesture(-0.1 * e.delta.y)
-- 		end,
-- 	},
-- })
