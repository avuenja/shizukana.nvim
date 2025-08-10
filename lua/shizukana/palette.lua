local M = {}

M.colors = {
	-- ============================================
	-- Moon Variant (Dark Mode - Primary)
	-- ============================================
	moon = {
		-- Base colors
		bg = "#12131a", -- Main background (not pure black for comfort)
		bg_dark = "#0b0b0f", -- Darker background
		bg_highlight = "#1f2333", -- Selection background

		-- Foreground with adjusted opacity for visual comfort
		fg = "#c8d3f5", -- Main text (86% opacity conceptual)
		fg_dark = "#a9b1d6", -- Secondary text (60% opacity)
		fg_gutter = "#545c7e", -- Comments and gutters

		-- Sakura colors (cherry blossoms)
		sakura = "#ffc0d9", -- Soft sakura pink
		sakura_light = "#ffddeb", -- Lighter sakura
		sakura_dark = "#ff9db4", -- Deeper sakura

		-- Torii colors (sacred gates)
		torii = "#ff757f", -- Soft torii red
		torii_bright = "#ff9e64", -- Bright orange-red

		-- Yamabuki colors (traditional golden)
		yamabuki = "#e0af68", -- Golden yamabuki
		yamabuki_light = "#f7c67f", -- Light gold

		-- Bamboo colors (green bamboo)
		bamboo = "#9ece6a", -- Young bamboo green
		bamboo_dark = "#73a857", -- Mature bamboo green
		bamboo_forest = "#41a6b5", -- Forest blue-green

		-- Sumi colors (traditional ink)
		sumi = "#7aa2f7", -- Sumi blue
		sumi_dark = "#3d59a1", -- Dark sumi blue
		sumi_light = "#b4d4f1", -- Light sumi blue

		-- Murasaki colors (traditional purple)
		murasaki = "#bb9af7", -- Traditional purple
		murasaki_dark = "#9d7cd8", -- Dark purple

		-- Auxiliary colors
		comment = "#636da6", -- Comments (WCAG AA contrast)
		black = "#15161e",
		white = "#ffffff",

		-- Semantic colors
		error = "#f7768e", -- Error (soft red)
		warning = "#ff9e64", -- Warning (orange)
		info = "#7aa2f7", -- Info (blue)
		hint = "#73daca", -- Hint (teal)
		ok = "#9ece6a", -- Success (green)

		-- Git colors
		git_add = "#9ece6a",
		git_change = "#7aa2f7",
		git_delete = "#f7768e",
		git_text = "#414868",

		-- Diagnostic LSP
		diag_error = "#db4b4b",
		diag_warning = "#e0af68",
		diag_info = "#0db9d7",
		diag_hint = "#1abc9c",

		-- Terminal colors
		red = "#f7768e",
		green = "#9ece6a",
		yellow = "#e0af68",
		blue = "#7aa2f7",
		magenta = "#bb9af7",
		cyan = "#7dcfff",

		black_br = "#363b54",
		red_br = "#f7768e",
		green_br = "#9ece6a",
		yellow_br = "#e0af68",
		blue_br = "#7aa2f7",
		magenta_br = "#bb9af7",
		cyan_br = "#7dcfff",
	},

	-- ============================================
	-- Dawn Variant (Light Mode)
	-- ============================================
	dawn = {
		-- Base colors (light backgrounds)
		bg = "#faf4ed", -- Warm white background
		bg_dark = "#fffdfb", -- Slightly darker white
		bg_highlight = "#f2e9e1", -- Selection background

		-- Foreground (darker for light mode)
		fg = "#575279", -- Main text
		fg_dark = "#6e6a86", -- Secondary text
		fg_gutter = "#9893a5", -- Comments and gutters

		-- Sakura colors (adjusted for light mode)
		sakura = "#b4637a", -- Deeper sakura for contrast
		sakura_light = "#d7827e", -- Light sakura
		sakura_dark = "#a54258", -- Dark sakura

		-- Torii colors
		torii = "#d20f39", -- Strong red for light mode
		torii_bright = "#fe640b", -- Bright orange

		-- Yamabuki colors
		yamabuki = "#ea9d34", -- Golden for light mode
		yamabuki_light = "#f6c177", -- Light gold

		-- Bamboo colors
		bamboo = "#568a3a", -- Forest green
		bamboo_dark = "#40634a", -- Dark forest green
		bamboo_forest = "#179299", -- Teal

		-- Sumi colors
		sumi = "#286983", -- Deep blue for light mode
		sumi_dark = "#1e5d74", -- Darker blue
		sumi_light = "#56949f", -- Light blue

		-- Murasaki colors
		murasaki = "#907aa9", -- Purple for light mode
		murasaki_dark = "#7e6c8e", -- Dark purple

		-- Auxiliary colors
		comment = "#9893a5", -- Comments
		black = "#575279",
		white = "#faf4ed",

		-- Semantic colors
		error = "#d20f39",
		warning = "#fe640b",
		info = "#286983",
		hint = "#179299",
		ok = "#568a3a",

		-- Git colors
		git_add = "#568a3a",
		git_change = "#286983",
		git_delete = "#d20f39",
		git_text = "#e6e9ef",

		-- Diagnostic LSP
		diag_error = "#b4637a",
		diag_warning = "#ea9d34",
		diag_info = "#56949f",
		diag_hint = "#6e9593",

		-- Terminal colors
		red = "#d20f39",
		green = "#568a3a",
		yellow = "#ea9d34",
		blue = "#286983",
		magenta = "#907aa9",
		cyan = "#179299",

		black_br = "#6e6a86",
		red_br = "#d20f39",
		green_br = "#568a3a",
		yellow_br = "#ea9d34",
		blue_br = "#286983",
		magenta_br = "#907aa9",
		cyan_br = "#179299",
	},

	-- ============================================
	-- Dusk Variant (Twilight Mode)
	-- ============================================
	dusk = {
		-- Base colors (twilight tones)
		bg = "#232136", -- Twilight purple-gray
		bg_dark = "#1f1d2e", -- Darker twilight
		bg_highlight = "#2d2a45", -- Selection background

		-- Foreground (balanced for twilight)
		fg = "#e0def4", -- Soft lavender white
		fg_dark = "#c4c0e3", -- Secondary text
		fg_gutter = "#6e6a86", -- Comments and gutters

		-- Sakura colors (twilight adjusted)
		sakura = "#d4a5b5", -- Dusty rose
		sakura_light = "#ebbcba", -- Light dusty rose
		sakura_dark = "#c4889f", -- Deep dusty rose

		-- Torii colors
		torii = "#e06b74", -- Warm red
		torii_bright = "#ea9a97", -- Coral

		-- Yamabuki colors
		yamabuki = "#d4a76a", -- Sunset gold
		yamabuki_light = "#f6c177", -- Light sunset

		-- Bamboo colors
		bamboo = "#8fb573", -- Sage green
		bamboo_dark = "#6b8c5a", -- Dark sage
		bamboo_forest = "#5ca7a8", -- Seafoam

		-- Sumi colors
		sumi = "#6494c4", -- Twilight blue
		sumi_dark = "#4a6fa5", -- Deep twilight blue
		sumi_light = "#9ccfd8", -- Light sky blue

		-- Murasaki colors
		murasaki = "#a594c7", -- Lavender purple
		murasaki_dark = "#8474a8", -- Deep lavender

		-- Auxiliary colors
		comment = "#817c9c", -- Muted purple comments
		black = "#191726",
		white = "#e0def4",

		-- Semantic colors
		error = "#eb6f92",
		warning = "#ea9a97",
		info = "#6494c4",
		hint = "#5ca7a8",
		ok = "#8fb573",

		-- Git colors
		git_add = "#8fb573",
		git_change = "#6494c4",
		git_delete = "#eb6f92",
		git_text = "#3e3a53",

		-- Diagnostic LSP
		diag_error = "#d67e96",
		diag_warning = "#d4a76a",
		diag_info = "#7aa5d2",
		diag_hint = "#6fc3a7",

		-- Terminal colors
		red = "#eb6f92",
		green = "#8fb573",
		yellow = "#f6c177",
		blue = "#6494c4",
		magenta = "#c4a7e7",
		cyan = "#9ccfd8",

		black_br = "#403d52",
		red_br = "#eb6f92",
		green_br = "#8fb573",
		yellow_br = "#f6c177",
		blue_br = "#6494c4",
		magenta_br = "#c4a7e7",
		cyan_br = "#9ccfd8",
	},
}

function M.get_colors(style)
	style = style or "moon"
	return M.colors[style] or M.colors.moon
end

function M.show_palette()
	local style = vim.g.shizukana_style or "moon"
	local colors = M.get_colors(style)

	print("=== Shizukana Palette - " .. style .. " ===")
	for name, color in pairs(colors) do
		local hl_name = "ShizukanaShow_" .. name
		vim.api.nvim_set_hl(0, hl_name, { fg = color, bg = colors.bg })
		vim.cmd(string.format("echohl %s | echon '%s: %s' | echohl None", hl_name, name, color))
	end
end

return M
