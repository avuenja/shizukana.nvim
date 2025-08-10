-- Base16 theme generator

local M = {}

function M.filename(style)
	return "base16-shizukana-" .. style .. ".yaml"
end

function M.generate(colors, style)
	-- Base16 requires exactly 16 colors in specific semantic order
	local template = [[
# Shizukana Theme for Base16 (%s)
# Generated automatically - do not edit

scheme: "Shizukana %s"
author: "Generated from Shizukana.nvim"
base00: "%s" # Default Background
base01: "%s" # Lighter Background (Used for status bars)
base02: "%s" # Selection Background
base03: "%s" # Comments, Invisibles, Line Highlighting
base04: "%s" # Dark Foreground (Used for status bars)
base05: "%s" # Default Foreground, Caret, Delimiters, Operators
base06: "%s" # Light Foreground (Not often used)
base07: "%s" # Light Background (Not often used)
base08: "%s" # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09: "%s" # Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A: "%s" # Classes, Markup Bold, Search Text Background
base0B: "%s" # Strings, Inherited Class, Markup Code, Diff Inserted
base0C: "%s" # Support, Regular Expressions, Escape Characters, Markup Quotes
base0D: "%s" # Functions, Methods, Attribute IDs, Headings
base0E: "%s" # Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F: "%s" # Deprecated, Opening/Closing Embedded Language Tags
]]

	-- Remove # from hex colors for base16 format
	local function clean_hex(hex)
		return hex:gsub("#", "")
	end

	return string.format(
		template,
		style,
		style:gsub("^%l", string.upper),
		clean_hex(colors.bg), -- base00
		clean_hex(colors.bg_dark), -- base01
		clean_hex(colors.bg_highlight), -- base02
		clean_hex(colors.comment), -- base03
		clean_hex(colors.fg_dark), -- base04
		clean_hex(colors.fg), -- base05
		clean_hex(colors.fg), -- base06
		clean_hex(colors.white or colors.fg), -- base07
		clean_hex(colors.torii), -- base08
		clean_hex(colors.torii_bright), -- base09
		clean_hex(colors.yamabuki), -- base0A
		clean_hex(colors.bamboo), -- base0B
		clean_hex(colors.bamboo_forest), -- base0C
		clean_hex(colors.sumi), -- base0D
		clean_hex(colors.murasaki), -- base0E
		clean_hex(colors.sakura) -- base0F
	)
end

return M
