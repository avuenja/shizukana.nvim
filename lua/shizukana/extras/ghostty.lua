-- Ghostty terminal theme generator

local M = {}

function M.filename(style)
	return "ghostty-shizukana-" .. style
end

function M.generate(colors, style)
	local template = [[
# Shizukana Theme for Ghostty (%s)
# Generated automatically - do not edit

# Core colors
background = %s
foreground = %s
cursor-color = %s
selection-background = %s
selection-foreground = %s

# Palette colors
palette = 0=%s
palette = 1=%s
palette = 2=%s
palette = 3=%s
palette = 4=%s
palette = 5=%s
palette = 6=%s
palette = 7=%s
palette = 8=%s
palette = 9=%s
palette = 10=%s
palette = 11=%s
palette = 12=%s
palette = 13=%s
palette = 14=%s
palette = 15=%s

# Additional settings
cursor-style = block
cursor-style-blink = true
cursor-color = %s
bold-is-bright = false
]]

	return string.format(
		template,
		style,
		-- Core colors
		colors.bg,
		colors.fg,
		colors.fg,
		colors.bg_highlight,
		colors.fg,
		-- Palette (0-7 normal, 8-15 bright)
		colors.black,
		colors.red,
		colors.green,
		colors.yellow,
		colors.blue,
		colors.magenta,
		colors.cyan,
		colors.white or colors.fg,
		colors.black_br,
		colors.red_br,
		colors.green_br,
		colors.yellow_br,
		colors.blue_br,
		colors.magenta_br,
		colors.cyan_br,
		colors.white or colors.fg,
		-- Cursor again
		colors.fg
	)
end

return M
