-- Kitty terminal theme generator

local M = {}

function M.filename(style)
	return "kitty-shizukana-" .. style .. ".conf"
end

function M.generate(colors, style)
	local template = [[
# Shizukana Theme for Kitty (%s)
# Generated automatically - do not edit

# Core colors
foreground              %s
background              %s
selection_foreground    %s
selection_background    %s

# Cursor colors
cursor                  %s
cursor_text_color       %s

# URL color
url_color               %s

# Border colors
active_border_color     %s
inactive_border_color   %s
bell_border_color       %s

# Tab bar colors
active_tab_foreground   %s
active_tab_background   %s
inactive_tab_foreground %s
inactive_tab_background %s
tab_bar_background      %s

# Mark colors
mark1_foreground        %s
mark1_background        %s
mark2_foreground        %s
mark2_background        %s
mark3_foreground        %s
mark3_background        %s

# The 16 terminal colors

# Black
color0                  %s
color8                  %s

# Red
color1                  %s
color9                  %s

# Green
color2                  %s
color10                 %s

# Yellow
color3                  %s
color11                 %s

# Blue
color4                  %s
color12                 %s

# Magenta
color5                  %s
color13                 %s

# Cyan
color6                  %s
color14                 %s

# White
color7                  %s
color15                 %s
]]

	return string.format(
		template,
		style,
		-- Core
		colors.fg,
		colors.bg,
		colors.fg,
		colors.bg_highlight,
		-- Cursor
		colors.fg,
		colors.bg,
		-- URL
		colors.sumi,
		-- Borders
		colors.murasaki,
		colors.bg_highlight,
		colors.torii,
		-- Tab bar
		colors.fg,
		colors.bg,
		colors.fg_gutter,
		colors.bg_dark,
		colors.black,
		-- Marks
		colors.black,
		colors.sakura,
		colors.black,
		colors.bamboo,
		colors.black,
		colors.sumi,
		-- Terminal colors
		colors.black,
		colors.black_br,
		colors.red,
		colors.red_br,
		colors.green,
		colors.green_br,
		colors.yellow,
		colors.yellow_br,
		colors.blue,
		colors.blue_br,
		colors.magenta,
		colors.magenta_br,
		colors.cyan,
		colors.cyan_br,
		colors.white or colors.fg,
		colors.white or colors.fg
	)
end

return M
