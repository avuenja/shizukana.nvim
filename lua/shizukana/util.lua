local M = {}

-- Convert hex to RGB
function M.hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return {
		r = tonumber(hex:sub(1, 2), 16),
		g = tonumber(hex:sub(3, 4), 16),
		b = tonumber(hex:sub(5, 6), 16),
	}
end

-- Convert RGB to hex
function M.rgb_to_hex(rgb)
	return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

-- Darken a color by a percentage
function M.darken(hex, percent)
	local rgb = M.hex_to_rgb(hex)

	rgb.r = math.floor(rgb.r * (1 - percent))
	rgb.g = math.floor(rgb.g * (1 - percent))
	rgb.b = math.floor(rgb.b * (1 - percent))

	return M.rgb_to_hex(rgb)
end

-- Lighten a color by a percentage
function M.lighten(hex, percent)
	local rgb = M.hex_to_rgb(hex)

	rgb.r = math.min(255, math.floor(rgb.r + (255 - rgb.r) * percent))
	rgb.g = math.min(255, math.floor(rgb.g + (255 - rgb.g) * percent))
	rgb.b = math.min(255, math.floor(rgb.b + (255 - rgb.b) * percent))

	return M.rgb_to_hex(rgb)
end

-- Blend two colors
function M.blend(hex1, hex2, ratio)
	local rgb1 = M.hex_to_rgb(hex1)
	local rgb2 = M.hex_to_rgb(hex2)

	local blended = {
		r = math.floor(rgb1.r * ratio + rgb2.r * (1 - ratio)),
		g = math.floor(rgb1.g * ratio + rgb2.g * (1 - ratio)),
		b = math.floor(rgb1.b * ratio + rgb2.b * (1 - ratio)),
	}

	return M.rgb_to_hex(blended)
end

-- Calculate constrast WCAG between two colors
function M.calculate_contrast(hex1, hex2)
	local function relative_luminance(rgb)
		local function adjust(val)
			val = val / 255
			if val <= 0.03928 then
				return val / 12.92
			else
				return math.pow((val + 0.055) / 1.055, 2.4)
			end
		end

		local r = adjust(rgb.r)
		local g = adjust(rgb.g)
		local b = adjust(rgb.b)

		return 0.2126 * r + 0.7152 * g + 0.0722 * b
	end

	local rgb1 = M.hex_to_rgb(hex1)
	local rgb2 = M.hex_to_rgb(hex2)

	local l1 = relative_luminance(rgb1)
	local l2 = relative_luminance(rgb2)

	local lighter = math.max(l1, l2)
	local darker = math.min(l1, l2)

	return (lighter + 0.05) / (darker + 0.05)
end

-- Verify if the contrast meets WCAG AA (4.5:1)
function M.is_wcag_aa(hex1, hex2)
	return M.calculate_contrast(hex1, hex2) >= 4.5
end

-- Verify if the contrast meets WCAG AAA (7:1)
function M.is_wcag_aaa(hex1, hex2)
	return M.calculate_contrast(hex1, hex2) >= 7
end

-- Debug: show constrast of all colors on background
function M.check_contrast(colors)
	print("=== WCAG Contrast Check ===")
	for name, color in pairs(colors) do
		if name ~= "bg" and type(color) == "string" and color:match("^#") then
			local contrast = M.calculate_contrast(color, colors.bg)
			local aa = M.is_wcag_aa(color, colors.bg) and "✓" or "✗"
			local aaa = M.is_wcag_aaa(color, colors.bg) and "✓" or "✗"
			print(string.format("%s: %.2f:1 (AA:%s AAA:%s)", name, contrast, aa, aaa))
		end
	end
end

-- Validate contrast for all colors in current or specified style
function M.validate_contrast(style)
	local palette = require("shizukana.palette")
	local current_style = style or vim.g.shizukana_style or "moon"
	local colors = palette.get_colors(current_style)

	print("=== WCAG Contrast Validation (" .. current_style .. ") ===")

	local results = {
		aaa = 0,
		aa = 0,
		fail = 0,
	}

	for name, color in pairs(colors) do
		if
			name ~= "bg"
			and name ~= "bg_dark"
			and name ~= "bg_highlight"
			and type(color) == "string"
			and color:match("^#")
		then
			local contrast = M.calculate_contrast(color, colors.bg)
			local status

			if contrast >= 7 then
				status = "AAA ✓"
				results.aaa = results.aaa + 1
			elseif contrast >= 4.5 then
				status = "AA  ✓"
				results.aa = results.aa + 1
			else
				status = "FAIL✗"
				results.fail = results.fail + 1
			end

			print(string.format("%s %.2f:1  %s - %s", status, contrast, color, name))
		end
	end

	print("\n=== Summary ===")
	print(string.format("AAA: %d | AA: %d | FAIL: %d", results.aaa, results.aa, results.fail))

	if results.fail > 0 then
		print("✗ Some colors fail WCAG standards!")
	elseif results.aa > 0 then
		print("✓ All colors pass WCAG AA (4.5:1)")
	else
		print("✓✓ All colors pass WCAG AAA (7:1)!")
	end
end

return M
