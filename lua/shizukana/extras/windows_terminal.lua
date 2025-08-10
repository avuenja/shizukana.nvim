-- Windows Terminal theme generator

local M = {}

function M.filename(style)
	return "windows-terminal-shizukana-" .. style .. ".json"
end

function M.generate(colors, style)
	local template = [[
{
  "name": "Shizukana %s",
  "background": "%s",
  "foreground": "%s",
  "cursorColor": "%s",
  "selectionBackground": "%s",
  "black": "%s",
  "red": "%s",
  "green": "%s",
  "yellow": "%s",
  "blue": "%s",
  "purple": "%s",
  "cyan": "%s",
  "white": "%s",
  "brightBlack": "%s",
  "brightRed": "%s",
  "brightGreen": "%s",
  "brightYellow": "%s",
  "brightBlue": "%s",
  "brightPurple": "%s",
  "brightCyan": "%s",
  "brightWhite": "%s"
}
]]

	return string.format(
		template,
		style:gsub("^%l", string.upper),
		colors.bg,
		colors.fg,
		colors.fg,
		colors.bg_highlight,
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
		colors.white or colors.fg
	)
end

return M
