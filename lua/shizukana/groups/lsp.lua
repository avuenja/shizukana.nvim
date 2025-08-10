local M = {}

function M.get_highlights(colors, config)
	local highlights = {}

	-- ===========================================
	-- LSP Semantic Tokens
	-- ===========================================

	-- Namespaces and Types
	highlights["@lsp.type.namespace"] = { fg = colors.murasaki }
	highlights["@lsp.type.type"] = { fg = colors.bamboo_forest }
	highlights["@lsp.type.class"] = { fg = colors.yamabuki }
	highlights["@lsp.type.enum"] = { fg = colors.yamabuki }
	highlights["@lsp.type.interface"] = { fg = colors.yamabuki_light }
	highlights["@lsp.type.struct"] = { fg = colors.yamabuki }
	highlights["@lsp.type.typeParameter"] = { fg = colors.bamboo_forest }

	-- Variables and Parameters
	highlights["@lsp.type.parameter"] = { fg = colors.yamabuki_light }
	highlights["@lsp.type.variable"] = { fg = colors.fg }
	highlights["@lsp.type.property"] = { fg = colors.fg }
	highlights["@lsp.type.enumMember"] = { fg = colors.torii_bright }
	highlights["@lsp.type.event"] = { fg = colors.sumi }

	-- Functions and Methods
	highlights["@lsp.type.function"] = { fg = colors.sumi }
	highlights["@lsp.type.method"] = { fg = colors.sumi }
	highlights["@lsp.type.macro"] = { fg = colors.torii }
	highlights["@lsp.type.keyword"] = { fg = colors.murasaki_dark }
	highlights["@lsp.type.modifier"] = { fg = colors.murasaki }
	highlights["@lsp.type.comment"] = { fg = colors.comment }
	highlights["@lsp.type.string"] = { fg = colors.bamboo }
	highlights["@lsp.type.number"] = { fg = colors.sakura }
	highlights["@lsp.type.regexp"] = { fg = colors.bamboo_forest }
	highlights["@lsp.type.operator"] = { fg = colors.bamboo_forest }
	highlights["@lsp.type.decorator"] = { fg = colors.yamabuki }

	-- ============================================
	-- LSP Modifiers
	-- ============================================

	highlights["@lsp.mod.declaration"] = {}
	highlights["@lsp.mod.definition"] = {}
	highlights["@lsp.mod.readonly"] = { italic = true }
	highlights["@lsp.mod.static"] = { bold = true }
	highlights["@lsp.mod.deprecated"] = { strikethrough = true }
	highlights["@lsp.mod.abstract"] = { italic = true }
	highlights["@lsp.mod.async"] = { italic = true }
	highlights["@lsp.mod.modification"] = {}
	highlights["@lsp.mod.documentation"] = { bold = true }
	highlights["@lsp.mod.defaultLibrary"] = { bold = true }

	-- Combinations type.modifier
	highlights["@lsp.typemod.function.defaultLibrary"] = {
		fg = colors.sumi_dark,
		bold = true,
	}
	highlights["@lsp.typemod.variable.defaultLibrary"] = {
		fg = colors.torii,
		bold = true,
	}
	highlights["@lsp.typemod.method.defaultLibrary"] = {
		fg = colors.sumi_dark,
		bold = true,
	}
	highlights["@lsp.typemod.variable.readonly"] = {
		fg = colors.fg,
		italic = true,
	}
	highlights["@lsp.typemod.property.readonly"] = {
		fg = colors.fg,
		italic = true,
	}

	-- ============================================
	-- LSP Diagnostics
	-- ============================================

	-- Diagnostic text
	highlights.DiagnosticError = { fg = colors.diag_error }
	highlights.DiagnosticWarn = { fg = colors.diag_warning }
	highlights.DiagnosticInfo = { fg = colors.diag_info }
	highlights.DiagnosticHint = { fg = colors.diag_hint }
	highlights.DiagnosticOk = { fg = colors.bamboo }

	-- Virtual text
	highlights.DiagnosticVirtualTextError = {
		fg = colors.diag_error,
		bg = require("shizukana.util").darken(colors.diag_error, 0.9),
	}
	highlights.DiagnosticVirtualTextWarn = {
		fg = colors.diag_warning,
		bg = require("shizukana.util").darken(colors.diag_warning, 0.9),
	}
	highlights.DiagnosticVirtualTextInfo = {
		fg = colors.diag_info,
		bg = require("shizukana.util").darken(colors.diag_info, 0.9),
	}
	highlights.DiagnosticVirtualTextHint = {
		fg = colors.diag_hint,
		bg = require("shizukana.util").darken(colors.diag_hint, 0.9),
	}

	-- Underline
	highlights.DiagnosticUnderlineError = {
		undercurl = true,
		sp = colors.diag_error,
	}
	highlights.DiagnosticUnderlineWarn = {
		undercurl = true,
		sp = colors.diag_warning,
	}
	highlights.DiagnosticUnderlineInfo = {
		undercurl = true,
		sp = colors.diag_info,
	}
	highlights.DiagnosticUnderlineHint = {
		undercurl = true,
		sp = colors.diag_hint,
	}

	-- Signs on gutter
	highlights.DiagnosticSignError = { fg = colors.diag_error }
	highlights.DiagnosticSignWarn = { fg = colors.diag_warning }
	highlights.DiagnosticSignInfo = { fg = colors.diag_info }
	highlights.DiagnosticSignHint = { fg = colors.diag_hint }

	-- Floating windows
	highlights.DiagnosticFloatingError = { fg = colors.diag_error }
	highlights.DiagnosticFloatingWarn = { fg = colors.diag_warning }
	highlights.DiagnosticFloatingInfo = { fg = colors.diag_info }
	highlights.DiagnosticFloatingHint = { fg = colors.diag_hint }

	-- ============================================
	-- LSP References and Highlights
	-- ============================================

	highlights.LspReferenceText = {
		bg = require("shizukana.util").darken(colors.sumi, 0.5),
	}
	highlights.LspReferenceRead = {
		bg = require("shizukana.util").darken(colors.sumi, 0.5),
	}
	highlights.LspReferenceWrite = {
		bg = require("shizukana.util").darken(colors.sumi, 0.5),
	}

	-- CodeLens
	highlights.LspCodeLens = { fg = colors.comment, italic = true }
	highlights.LspCodeLensSeparator = { fg = colors.fg_gutter }

	-- Signature Help
	highlights.LspSignatureActiveParameter = {
		fg = colors.yamabuki,
		bold = true,
		underline = true,
	}

	-- Inlay Hints
	highlights.LspInlayHint = {
		fg = colors.comment,
		bg = require("shizukana.util").darken(colors.bg_highlight, 0.5),
		italic = true,
	}

	return highlights
end

return M
