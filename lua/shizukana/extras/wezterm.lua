-- WezTerm theme generator

local M = {}

function M.filename(style)
	return "wezterm-shizukana-" .. style .. ".lua"
end

function M.generate(colors, style)
	local template = [[
-- Shizukana Theme for WezTerm (%s)
-- Generated automatically - do not edit

return {
  -- Core colors
  foreground = '%s',
  background = '%s',
  cursor_bg = '%s',
  cursor_fg = '%s',
  cursor_border = '%s',
  selection_fg = '%s',
  selection_bg = '%s',
  scrollbar_thumb = '%s',
  split = '%s',

  -- Palette
  ansi = {
    '%s', -- black
    '%s', -- red
    '%s', -- green
    '%s', -- yellow
    '%s', -- blue
    '%s', -- magenta
    '%s', -- cyan
    '%s', -- white
  },
  brights = {
    '%s', -- bright black
    '%s', -- bright red
    '%s', -- bright green
    '%s', -- bright yellow
    '%s', -- bright blue
    '%s', -- bright magenta
    '%s', -- bright cyan
    '%s', -- bright white
  },

  -- Tab bar
  tab_bar = {
    background = '%s',
    active_tab = {
      bg_color = '%s',
      fg_color = '%s',
    },
    inactive_tab = {
      bg_color = '%s',
      fg_color = '%s',
    },
    inactive_tab_hover = {
      bg_color = '%s',
      fg_color = '%s',
    },
    new_tab = {
      bg_color = '%s',
      fg_color = '%s',
    },
    new_tab_hover = {
      bg_color = '%s',
      fg_color = '%s',
    },
  },
}
]]

	return string.format(
		template,
		style,
		-- Core colors
		colors.fg,
		colors.bg,
		colors.fg,
		colors.bg,
		colors.fg,
		colors.fg,
		colors.bg_highlight,
		colors.fg_gutter,
		colors.bg_highlight,
		-- ANSI colors
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
		-- Tab bar
		colors.bg_dark,
		colors.bg,
		colors.fg,
		colors.bg_dark,
		colors.fg_gutter,
		colors.bg_highlight,
		colors.fg_dark,
		colors.bg_dark,
		colors.fg_gutter,
		colors.bg_highlight,
		colors.fg
	)
end

return M
