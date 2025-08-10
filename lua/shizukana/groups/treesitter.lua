local M = {}

function M.get_highlights(colors, config)
	local highlights = {}

	local function apply_styles(base, styles)
		return vim.tbl_extend("force", base, styles or {})
	end

	-- =========================================
	-- TreeSitter Base Groups (New API)
	-- =========================================

	-- Literals
	highlights["@string"] = { fg = colors.bamboo }
	highlights["@string.documentation"] = { fg = colors.bamboo_dark }
	highlights["@string.regex"] = { fg = colors.bamboo_forest }
	highlights["@string.escape"] = { fg = colors.sakura_dark }
	highlights["@string.special"] = { fg = colors.sakura }
	highlights["@string.special.symbol"] = { fg = colors.murasaki }
	highlights["@string.special.url"] = { fg = colors.sumi, underline = true }

	highlights["@character"] = { fg = colors.bamboo }
	highlights["@character.special"] = { fg = colors.sakura_dark }

	highlights["@boolean"] = { fg = colors.sakura_dark, bold = true }
	highlights["@number"] = { fg = colors.sakura }
	highlights["@number.float"] = { fg = colors.sakura }

	-- Variables and Identifiers
	highlights["@variable"] = apply_styles({ fg = colors.fg }, config.styles.variables)
	highlights["@variable.builtin"] = { fg = colors.torii }
	highlights["@variable.parameter"] = { fg = colors.yamabuki_light }
	highlights["@variable.parameter.builtin"] = { fg = colors.yamabuki }
	highlights["@variable.member"] = { fg = colors.fg }

	highlights["@constant"] = { fg = colors.torii_bright }
	highlights["@constant.builtin"] = { fg = colors.torii, bold = true }
	highlights["@constant.macro"] = { fg = colors.torii }

	highlights["@module"] = { fg = colors.murasaki }
	highlights["@module.builtin"] = { fg = colors.murasaki_dark }
	highlights["@label"] = { fg = colors.sumi }

	-- Functions
	highlights["@function"] = apply_styles({ fg = colors.sumi }, config.styles.functions)
	highlights["@function.builtin"] = { fg = colors.sumi_dark, bold = true }
	highlights["@function.call"] = { fg = colors.sumi }
	highlights["@function.macro"] = { fg = colors.torii }
	highlights["@function.method"] = { fg = colors.sumi }
	highlights["@function.method.call"] = { fg = colors.sumi }

	highlights["@constructor"] = { fg = colors.murasaki }
	highlights["@operator"] = apply_styles({ fg = colors.bamboo_forest }, config.styles.operators)

	-- Keywords
	highlights["@keyword"] = apply_styles({ fg = colors.murasaki_dark }, config.styles.keywords)
	highlights["@keyword.coroutine"] = { fg = colors.murasaki, italic = true }
	highlights["@keyword.function"] = { fg = colors.murasaki }
	highlights["@keyword.operator"] = { fg = colors.murasaki }
	highlights["@keyword.import"] = { fg = colors.murasaki, bold = true }
	highlights["@keyword.type"] = { fg = colors.yamabuki }
	highlights["@keyword.modifier"] = { fg = colors.murasaki }
	highlights["@keyword.repeat"] = apply_styles({ fg = colors.murasaki }, config.styles.conditionals)
	highlights["@keyword.return"] = { fg = colors.murasaki, bold = true }
	highlights["@keyword.debug"] = { fg = colors.torii }
	highlights["@keyword.exception"] = { fg = colors.torii }

	highlights["@keyword.conditional"] = apply_styles({ fg = colors.murasaki }, config.styles.conditionals)
	highlights["@keyword.conditional.ternary"] = apply_styles({ fg = colors.murasaki }, config.styles.conditionals)

	highlights["@keyword.directive"] = { fg = colors.yamabuki }
	highlights["@keyword.directive.define"] = { fg = colors.murasaki_dark }

	-- Types
	highlights["@type"] = { fg = colors.bamboo_forest }
	highlights["@type.builtin"] = { fg = colors.bamboo_forest, bold = true }
	highlights["@type.definition"] = { fg = colors.yamabuki }
	highlights["@type.qualifier"] = { fg = colors.murasaki }

	highlights["@attribute"] = { fg = colors.yamabuki }
	highlights["@attribute.builtin"] = { fg = colors.yamabuki, bold = true }
	highlights["@property"] = { fg = colors.fg }

	-- Ponctuation and Delimiters
	highlights["@punctuation.delimiter"] = { fg = colors.fg_dark }
	highlights["@punctuation.bracket"] = { fg = colors.fg_dark }
	highlights["@punctuation.special"] = { fg = colors.bamboo_forest }

	-- Comments and Documentation
	highlights["@comment"] = apply_styles({ fg = colors.comment }, config.styles.comments)
	highlights["@comment.documentation"] =
		apply_styles({ fg = colors.comment }, vim.tbl_extend("force", config.styles.comments or {}, { bold = true }))
	highlights["@comment.error"] = { fg = colors.error, bold = true }
	highlights["@comment.warning"] = { fg = colors.warning, bold = true }
	highlights["@comment.todo"] = { fg = colors.bg, bg = colors.yamabuki, bold = true }
	highlights["@comment.note"] = { fg = colors.bg, bg = colors.info, bold = true }

	-- Markup (Markdown, etc)
	highlights["@markup.strong"] = { bold = true }
	highlights["@markup.italic"] = { italic = true }
	highlights["@markup.strikethrough"] = { strikethrough = true }
	highlights["@markup.underline"] = { underline = true }

	highlights["@markup.heading"] = { fg = colors.murasaki, bold = true }
	highlights["@markup.heading.1"] = { fg = colors.torii, bold = true }
	highlights["@markup.heading.2"] = { fg = colors.murasaki, bold = true }
	highlights["@markup.heading.3"] = { fg = colors.sumi, bold = true }
	highlights["@markup.heading.4"] = { fg = colors.bamboo, bold = true }
	highlights["@markup.heading.5"] = { fg = colors.yamabuki }
	highlights["@markup.heading.6"] = { fg = colors.sakura }

	highlights["@markup.quote"] = { fg = colors.fg_dark, italic = true }
	highlights["@markup.math"] = { fg = colors.sumi }
	highlights["@markup.link"] = { fg = colors.sumi, underline = true }
	highlights["@markup.link.label"] = { fg = colors.murasaki }
	highlights["@markup.link.url"] = { fg = colors.sumi, underline = true }
	highlights["@markup.raw"] = { fg = colors.bamboo }
	highlights["@markup.raw.block"] = { fg = colors.bamboo }
	highlights["@markup.list"] = { fg = colors.murasaki }
	highlights["@markup.list.checked"] = { fg = colors.bamboo }
	highlights["@markup.list.unchecked"] = { fg = colors.fg_dark }

	-- Diff
	highlights["@diff.plus"] = { fg = colors.git_add }
	highlights["@diff.minus"] = { fg = colors.git_delete }
	highlights["@diff.delta"] = { fg = colors.git_change }

	-- Tags (HTML, XML, etc)
	highlights["@tag"] = { fg = colors.torii }
	highlights["@tag.attribute"] = { fg = colors.yamabuki }
	highlights["@tag.delimiter"] = { fg = colors.fg_dark }

	-- ============================================
	-- Language-Specific Highlights
	-- ============================================

	-- Lua
	highlights["@lsp.type.variable.lua"] = { fg = colors.fg }
	highlights["@variable.lua"] = { fg = colors.fg }
	highlights["@field.lua"] = { fg = colors.fg }

	-- JavaScript/TypeScript
	highlights["@variable.javascript"] = { fg = colors.fg }
	highlights["@variable.typescript"] = { fg = colors.fg }
	highlights["@constructor.javascript"] = { fg = colors.murasaki }
	highlights["@constructor.typescript"] = { fg = colors.murasaki }
	highlights["@keyword.export.javascript"] = { fg = colors.murasaki, bold = true }
	highlights["@keyword.export.typescript"] = { fg = colors.murasaki, bold = true }

	-- Python
	highlights["@type.python"] = { fg = colors.bamboo_forest }
	highlights["@keyword.import.python"] = { fg = colors.murasaki, bold = true }
	highlights["@decorator.python"] = { fg = colors.yamabuki }

	-- Rust
	highlights["@type.rust"] = { fg = colors.bamboo_forest }
	highlights["@attribute.rust"] = { fg = colors.yamabuki }
	highlights["@punctuation.special.rust"] = { fg = colors.torii } -- lifetime

	-- Go
	highlights["@type.go"] = { fg = colors.bamboo_forest }
	highlights["@function.builtin.go"] = { fg = colors.sumi_dark, bold = true }

	-- ============================================
	-- Injections and Special Contexts
	-- ============================================

	highlights["@none"] = { fg = colors.fg }
	highlights["@conceal"] = { fg = colors.fg_gutter }
	-- For some reason, spell checking is allways enabled and this is not working properly
	-- highlights["@spell"] = { underline = true, sp = colors.error }
	highlights["@spell"] = {}
	highlights["@nospell"] = {}

	return highlights
end

return M
