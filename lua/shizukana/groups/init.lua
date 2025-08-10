local M = {}

function M.setup(colors, config)
	local util = require("shizukana.util")
	local highlights = {}

	local function apply_styles(base, styles)
		return vim.tbl_extend("force", base, styles or {})
	end

	-- Editor base
	highlights.Normal = { fg = colors.fg, bg = config.transparent and "NONE" or colors.bg }
	highlights.NormalFloat = { fg = colors.fg, bg = colors.bg_dark }
	highlights.FloatBorder = { fg = colors.bamboo_forest, bg = colors.bg_dark }
	highlights.ColorColumn = { bg = colors.bg_highlight }
	highlights.Cursor = { fg = colors.bg, bg = colors.fg }
	highlights.CursorLine = { bg = colors.bg_highlight }
	highlights.CursorLineNr = { fg = colors.sakura, bold = true }
	highlights.LineNr = { fg = colors.fg_gutter }

	-- Selection and Search
	highlights.Visual = { bg = util.darken(colors.sumi, 0.3) }
	highlights.VisualNOS = { bg = util.darken(colors.sumi, 0.3) }
	highlights.Search = { fg = colors.black, bg = colors.yamabuki }
	highlights.IncSearch = { fg = colors.black, bg = colors.torii_bright }
	highlights.CurSearch = { link = "IncSearch" }

	-- Diagnostics
	highlights.DiagnosticError = { fg = colors.diag_error }
	highlights.DiagnosticWarn = { fg = colors.diag_warning }
	highlights.DiagnosticInfo = { fg = colors.diag_info }
	highlights.DiagnosticHint = { fg = colors.diag_hint }

	-- Syntax base (fallback for non-TreeSitter themes)
	highlights.Comment = apply_styles({ fg = colors.comment }, config.styles.comments)
	highlights.Constant = { fg = colors.torii_bright }
	highlights.String = { fg = colors.bamboo }
	highlights.Character = { fg = colors.bamboo }
	highlights.Number = { fg = colors.sakura }
	highlights.Boolean = { fg = colors.sakura_dark }
	highlights.Float = { fg = colors.sakura }

	highlights.Identifier = apply_styles({ fg = colors.fg }, config.styles.variables)
	highlights.Function = apply_styles({ fg = colors.sumi }, config.styles.functions)

	highlights.Statement = { fg = colors.murasaki }
	highlights.Conditional = apply_styles({ fg = colors.murasaki }, config.styles.conditionals)
	highlights.Repeat = { fg = colors.murasaki }
	highlights.Label = { fg = colors.sumi }
	highlights.Operator = apply_styles({ fg = colors.bamboo_forest }, config.styles.operators)
	highlights.Keyword = apply_styles({ fg = colors.murasaki_dark }, config.styles.keywords)
	highlights.Exception = { fg = colors.torii }

	highlights.PreProc = { fg = colors.yamabuki }
	highlights.Include = { fg = colors.murasaki }
	highlights.Define = { fg = colors.murasaki_dark }
	highlights.Macro = { fg = colors.torii }
	highlights.PreCondit = { fg = colors.yamabuki }

	highlights.Type = { fg = colors.bamboo_forest }
	highlights.StorageClass = { fg = colors.murasaki }
	highlights.Structure = { fg = colors.yamabuki }
	highlights.Typedef = { fg = colors.yamabuki }

	highlights.Special = { fg = colors.sakura_dark }
	highlights.SpecialChar = { fg = colors.sakura }
	highlights.Tag = { fg = colors.sumi }
	highlights.Delimiter = { fg = colors.fg_dark }
	highlights.SpecialComment = { fg = colors.comment, italic = true }
	highlights.Debug = { fg = colors.torii }

	highlights.Underlined = { underline = true }
	highlights.Bold = { bold = true }
	highlights.Italic = { italic = true }

	highlights.Error = { fg = colors.error }
	highlights.Todo = { fg = colors.bg, bg = colors.yamabuki, bold = true }

	-- Diff
	highlights.DiffAdd = { bg = util.darken(colors.git_add, 0.15) }
	highlights.DiffChange = { bg = util.darken(colors.git_change, 0.15) }
	highlights.DiffDelete = { bg = util.darken(colors.git_delete, 0.15) }
	highlights.DiffText = { bg = util.darken(colors.git_text, 0.3) }

	-- StatusLine
	highlights.StatusLine = { fg = colors.fg, bg = colors.bg_highlight }
	highlights.StatusLineNC = { fg = colors.fg_gutter, bg = colors.bg_dark }

	-- Pmenu (popup menu)
	highlights.Pmenu = { fg = colors.fg, bg = colors.bg_dark }
	highlights.PmenuSel = { bg = colors.bg_highlight }
	highlights.PmenuSbar = { bg = colors.bg_dark }
	highlights.PmenuThumb = { bg = colors.fg_gutter }

	-- TabLine
	highlights.TabLine = { fg = colors.fg_gutter, bg = colors.bg_dark }
	highlights.TabLineFill = { bg = colors.black }
	highlights.TabLineSel = { fg = colors.fg, bg = colors.bg }

	-- If enabled, load specific highlights
	if config.plugins.treesitter then
		local ts = require("shizukana.groups.treesitter")
		highlights = vim.tbl_extend("force", highlights, ts.get_highlights(colors, config))
	end

	if config.plugins.lsp then
		local lsp = require("shizukana.groups.lsp")
		highlights = vim.tbl_extend("force", highlights, lsp.get_highlights(colors, config))
	end

	-- Auto-detect and load plugins
	if config.plugins.auto_detect then
		local plugins = require("shizukana.groups.plugins")
		highlights = vim.tbl_extend("force", highlights, plugins.get_highlights(colors, config))
	end

	return highlights
end

return M
