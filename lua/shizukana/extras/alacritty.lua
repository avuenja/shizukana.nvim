-- Alacritty terminal theme generator

local M = {}

function M.filename(style)
	return "alacritty-shizukana-" .. style .. ".toml"
end

function M.generate(colors, style)
	local template = [[
# Shizukana Theme for Alacritty (%s)
# Generated automatically - do not edit

[colors.primary]
background = '%s'
foreground = '%s'
dim_foreground = '%s'
bright_foreground = '%s'

[colors.cursor]
text = '%s'
cursor = '%s'

[colors.vi_mode_cursor]
text = '%s'
cursor = '%s'

[colors.search]
matches.foreground = '%s'
matches.background = '%s'
focused_match.foreground = '%s'
focused_match.background = '%s'

[colors.hints]
start.foreground = '%s'
start.background = '%s'
end.foreground = '%s'
end.background = '%s'

[colors.selection]
text = 'CellForeground'
background = '%s'

[colors.normal]
black = '%s'
red = '%s'
green = '%s'
yellow = '%s'
blue = '%s'
magenta = '%s'
cyan = '%s'
white = '%s'

[colors.bright]
black = '%s'
red = '%s'
green = '%s'
yellow = '%s'
blue = '%s'
magenta = '%s'
cyan = '%s'
white = '%s'

[colors.dim]
black = '%s'
red = '%s'
green = '%s'
yellow = '%s'
blue = '%s'
magenta = '%s'
cyan = '%s'
white = '%s'
]]

	return string.format(
		template,
		style,
		-- Primary
		colors.bg,
		colors.fg,
		colors.fg_dark,
		colors.fg,
		-- Cursor
		colors.bg,
		colors.fg,
		-- Vi mode cursor
		colors.bg,
		colors.murasaki,
		-- Search
		colors.black,
		colors.yamabuki,
		colors.black,
		colors.torii_bright,
		-- Hints
		colors.black,
		colors.yamabuki,
		colors.yamabuki,
		colors.black,
		-- Selection
		colors.bg_highlight,
		-- Normal colors
		colors.black,
		colors.red,
		colors.green,
		colors.yellow,
		colors.blue,
		colors.magenta,
		colors.cyan,
		colors.white or colors.fg,
		-- Bright colors
		colors.black_br,
		colors.red_br,
		colors.green_br,
		colors.yellow_br,
		colors.blue_br,
		colors.magenta_br,
		colors.cyan_br,
		colors.white or colors.fg,
		-- Dim colors (using slightly darkened versions)
		require("shizukana.util").darken(colors.black, 0.3),
		require("shizukana.util").darken(colors.red, 0.3),
		require("shizukana.util").darken(colors.green, 0.3),
		require("shizukana.util").darken(colors.yellow, 0.3),
		require("shizukana.util").darken(colors.blue, 0.3),
		require("shizukana.util").darken(colors.magenta, 0.3),
		require("shizukana.util").darken(colors.cyan, 0.3),
		require("shizukana.util").darken(colors.white or colors.fg, 0.3)
	)
end

return M
