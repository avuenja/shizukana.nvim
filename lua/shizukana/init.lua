local M = {}

-- Store setup configuration
M._config = nil
M._loaded = false

-- Default configuration
local defaults = {
	style = "moon", -- moon, dawn, dusk
	transparent = false,
	terminal_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.12, -- 12% more darker to inactive windows
	},
	styles = {
		comments = { italic = true },
		keywords = { bold = true },
		functions = {},
		variables = {},
		operators = {},
		conditionals = { italic = true },
	},
	plugins = {
		auto_detect = true, -- Auto-detect installed plugins
		telescope = true,
		nvim_tree = true,
		lualine = true,
		treesitter = true,
		lsp = true,
		cmp = true,
		gitsigns = true,
		indent_blankline = true,
	},
	-- Callbacks for advanced customization
	on_colors = function(colors) end,
	on_highlights = function(highlights, colors) end,
}

-- Setup function
function M.setup(opts)
	M._config = vim.tbl_deep_extend("force", defaults, opts or {})

	-- Set the variant globally based on config
	vim.g.shizukana_variant = M._config.style

	return M
end

-- Get config
function M.get_config()
	if not M._config then
		M._config = vim.deepcopy(defaults)
	end
	return M._config
end

-- Internal load the theme
function M._load(variant)
	local config = M.get_config()

	if variant then
		config.style = variant
		vim.g.shizukana_variant = variant
	end

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "shizukana"

	local palette = require("shizukana.palette")
	local colors = palette.get_colors(config.style)

	if config.on_colors then
		config.on_colors(colors)
	end

	local groups = require("shizukana.groups")
	local highlights = groups.setup(colors, config)

	if config.on_highlights then
		config.on_highlights(highlights, colors)
	end

	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	if config.terminal_colors then
		M.set_terminal_colors(colors)
	end

	if config.dim_inactive and config.dim_inactive.enabled then
		M.setup_dim_inactive(colors, config)
	end

	M._loaded = true
end

-- Public load function for manual loading
function M.load(style)
	style = style or M.get_config().style
	M._load(style)
end

-- Set terminal colors
function M.set_terminal_colors(colors)
	vim.g.terminal_color_0 = colors.black
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_3 = colors.yellow
	vim.g.terminal_color_4 = colors.blue
	vim.g.terminal_color_5 = colors.magenta
	vim.g.terminal_color_6 = colors.cyan
	vim.g.terminal_color_7 = colors.fg
	vim.g.terminal_color_8 = colors.black_br
	vim.g.terminal_color_9 = colors.red_br
	vim.g.terminal_color_10 = colors.green_br
	vim.g.terminal_color_11 = colors.yellow_br
	vim.g.terminal_color_12 = colors.blue_br
	vim.g.terminal_color_13 = colors.magenta_br
	vim.g.terminal_color_14 = colors.cyan_br
	vim.g.terminal_color_15 = colors.white or colors.fg
end

-- Dim inactive windows
function M.setup_dim_inactive(colors, config)
	local util = require("shizukana.util")
	local inactive_bg = util.darken(colors.bg, config.dim_inactive.percentage)

	vim.api.nvim_create_augroup("ShizukanaDimInactive", { clear = true })

	vim.api.nvim_create_autocmd("WinEnter", {
		group = "ShizukanaDimInactive",
		callback = function()
			vim.wo.winhighlight = ""
		end,
	})

	vim.api.nvim_create_autocmd("WinLeave", {
		group = "ShizukanaDimInactive",
		callback = function()
			vim.wo.winhighlight = string.format("Normal:NormalInactive,NormalFloat:NormalFloat,LineNr:LineNrInactive")
		end,
	})

	vim.api.nvim_set_hl(0, "NormalInactive", { bg = inactive_bg })
	vim.api.nvim_set_hl(0, "LineNrInactive", {
		fg = util.darken(colors.comment, 0.3),
		bg = inactive_bg,
	})
end

-- Change style on the fly
function M.set_style(style)
	if style == "" then
		local current = vim.g.shizukana_variant or "moon"
		local styles = { moon = "dawn", dawn = "dusk", dusk = "moon" }
		style = styles[current]
	end

	vim.g.shizukana_variant = style
	M._load(style)

	vim.notify("Switched to " .. style .. " style", vim.log.levels.INFO, { title = "Shizukana" })
end

-- Reload theme (useful for development)
function M.reload()
	-- Clear all cached modules
	local modules = {
		"shizukana",
		"shizukana.palette",
		"shizukana.groups",
		"shizukana.groups.init",
		"shizukana.groups.treesitter",
		"shizukana.groups.lsp",
		"shizukana.groups.plugins",
		"shizukana.util",
	}

	for _, module in ipairs(modules) do
		package.loaded[module] = nil
	end

	-- Clear config
	M._config = nil
	M._loaded = false

	-- Reload
	require("shizukana").load()

	vim.notify("Theme reloaded!", vim.log.levels.INFO, { title = "Shizukana" })
end

-- Completion function for style names
function M.complete_styles()
	return { "moon", "dawn", "dusk" }
end

-- Get current style
function M.get_style()
	return vim.g.shizukana_variant or "moon"
end

-- Export configuration for use by lualine and other plugins
function M.get_colors()
	return require("shizukana.palette").get_colors(M.get_style())
end

return M
