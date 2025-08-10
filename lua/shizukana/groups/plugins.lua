local M = {}

function M.get_highlights(colors, config)
	local highlights = {}
	local util = require("shizukana.util")

	local function is_installed(plugin)
		return pcall(require, plugin)
	end

	-- ===========================================
	-- Telescope
	-- ===========================================
	if config.plugins.telescope and is_installed("telescope") then
		-- Borders and Backgrounds
		highlights.TelescopeBorder = { fg = colors.bamboo_forest, bg = colors.bg_dark }
		highlights.TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark }
		highlights.TelescopePreviewNormal = { fg = colors.fg, bg = colors.bg }
		highlights.TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_highlight }
		highlights.TelescopeResultsNormal = { fg = colors.fg, bg = colors.bg_dark }

		-- Specific borders
		highlights.TelescopePromptBorder = { fg = colors.sakura, bg = colors.bg }
		highlights.TelescopeResultsBorder = { fg = colors.bamboo, bg = colors.bg_dark }
		highlights.TelescopePreviewBorder = { fg = colors.sumi, bg = colors.bg }

		-- Titles
		highlights.TelescopePromptTitle = {
			fg = colors.bg,
			bg = colors.sakura,
			bold = true,
		}
		highlights.TelescopeResultsTitle = {
			fg = colors.bg,
			bg = colors.bamboo,
			bold = true,
		}
		highlights.TelescopePreviewTitle = {
			fg = colors.bg,
			bg = colors.sumi,
			bold = true,
		}

		-- Selection
		highlights.TelescopeSelection = {
			fg = colors.fg,
			bg = colors.bg_highlight,
			bold = true,
		}
		highlights.TelescopeSelectionCaret = { fg = colors.torii, bg = colors.bg_highlight }
		highlights.TelescopeMultiSelection = { fg = colors.murasaki, bold = true }
		highlights.TelescopeMultiIcon = { fg = colors.yamabuki }

		-- Matching
		highlights.TelescopeMatching = { fg = colors.torii_bright, bold = true }
		highlights.TelescopePromptPrefix = { fg = colors.sakura }

		-- Counters
		highlights.TelescopePromptCounter = { fg = colors.fg_gutter }
		highlights.TelescopeResultsClass = { fg = colors.yamabuki }
		highlights.TelescopeResultsConstant = { fg = colors.torii_bright }
		highlights.TelescopeResultsField = { fg = colors.bamboo }
		highlights.TelescopeResultsFunction = { fg = colors.sumi }
		highlights.TelescopeResultsMethod = { fg = colors.sumi }
		highlights.TelescopeResultsOperator = { fg = colors.bamboo_forest }
		highlights.TelescopeResultsStruct = { fg = colors.yamabuki }
		highlights.TelescopeResultsVariable = { fg = colors.fg }
	end

	-- ===========================================
	-- NvimTree / NeoTree
	-- ===========================================
	if config.plugins.nvim_tree and (is_installed("nvim-tree") or is_installed("neo-tree")) then
		-- Backgrounds
		highlights.NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark }
		highlights.NvimTreeNormalFloat = { fg = colors.fg, bg = colors.bg_dark }
		highlights.NvimTreeEndOfBuffer = { fg = colors.bg_dark }
		highlights.NvimTreeWinSeparator = { fg = colors.bg_highlight, bg = colors.bg }

		-- Cursor and Selection
		highlights.NvimTreeCursorLine = { bg = colors.bg_highlight }
		highlights.NvimTreeCursorLineNr = { fg = colors.murasaki, bold = true }

		-- Folders
		highlights.NvimTreeFolderName = { fg = colors.sumi }
		highlights.NvimTreeFolderIcon = { fg = colors.sumi }
		highlights.NvimTreeOpenedFolderName = { fg = colors.sumi, bold = true }
		highlights.NvimTreeEmptyFolderName = { fg = colors.fg_gutter }
		highlights.NvimTreeRootFolder = { fg = colors.murasaki, bold = true }

		-- Files
		highlights.NvimTreeFileName = { fg = colors.fg }
		highlights.NvimTreeOpenedFile = { fg = colors.fg, bold = true }
		highlights.NvimTreeSpecialFile = { fg = colors.yamabuki, underline = true }
		highlights.NvimTreeImageFile = { fg = colors.sakura }
		highlights.NvimTreeExecFile = { fg = colors.bamboo, bold = true }
		highlights.NvimTreeSymlink = { fg = colors.bamboo_forest, italic = true }

		-- Git status
		highlights.NvimTreeGitDirty = { fg = colors.git_change }
		highlights.NvimTreeGitStaged = { fg = colors.git_add }
		highlights.NvimTreeGitMerge = { fg = colors.torii }
		highlights.NvimTreeGitRenamed = { fg = colors.murasaki }
		highlights.NvimTreeGitNew = { fg = colors.git_add }
		highlights.NvimTreeGitDeleted = { fg = colors.git_delete }
		highlights.NvimTreeGitIgnored = { fg = colors.fg_gutter }

		-- Indicators
		highlights.NvimTreeIndentMarker = { fg = colors.fg_gutter }
		highlights.NvimTreeLiveFilterPrefix = { fg = colors.torii, bold = true }
		highlights.NvimTreeLiveFilterValue = { fg = colors.bamboo, bold = true }
		highlights.NvimTreeWindowPicker = {
			fg = colors.bg,
			bg = colors.sakura,
			bold = true,
		}
	end

	-- ===========================================
	-- Lualine
	-- ===========================================
	if config.plugins.lualine and is_installed("lualine") then
		-- 	-- Lualine usually uses its own theme, but we can define custom highlights
		highlights.StatusLine = { fg = colors.fg, bg = colors.bg_highlight }
		highlights.StatusLineNC = { fg = colors.fg_gutter, bg = colors.bg_dark }

		-- Define the lualine theme (will be used in another file)
		M.lualine_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.sumi, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg_dark },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.bamboo, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg_dark },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.murasaki, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg_dark },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.torii, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg_dark },
			},
			command = {
				a = { fg = colors.bg, bg = colors.yamabuki, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg_dark },
			},
			inactive = {
				a = { fg = colors.fg_gutter, bg = colors.bg_dark },
				b = { fg = colors.fg_gutter, bg = colors.bg_dark },
				c = { fg = colors.fg_gutter, bg = colors.bg_dark },
			},
		}
	end

	-- ===========================================
	-- nvim-cmp (Autocomplete)
	-- ===========================================
	if config.plugins.cmp and is_installed("cmp") then
		highlights.CmpItemAbbrDefault = { fg = colors.fg }
		highlights.CmpItemAbbrMatch = { fg = colors.sumi, bold = true }
		highlights.CmpItemAbbrMatchFuzzy = { fg = colors.sumi, bold = true }
		highlights.CmpItemAbbrDeprecated = { fg = colors.fg_gutter, strikethrough = true }

		highlights.CmpItemMenu = { fg = colors.comment }
		highlights.CmpItemMenuDefault = { fg = colors.comment }

		-- Items and their kinds
		highlights.CmpItemKindDefault = { fg = colors.fg_dark }
		highlights.CmpItemKindKeyword = { fg = colors.murasaki }
		highlights.CmpItemKindVariable = { fg = colors.fg }
		highlights.CmpItemKindConstant = { fg = colors.torii_bright }
		highlights.CmpItemKindReference = { fg = colors.fg }
		highlights.CmpItemKindValue = { fg = colors.sakura }
		highlights.CmpItemKindFunction = { fg = colors.sumi }
		highlights.CmpItemKindMethod = { fg = colors.sumi }
		highlights.CmpItemKindConstructor = { fg = colors.murasaki }
		highlights.CmpItemKindClass = { fg = colors.yamabuki }
		highlights.CmpItemKindInterface = { fg = colors.yamabuki_light }
		highlights.CmpItemKindStruct = { fg = colors.yamabuki }
		highlights.CmpItemKindEnum = { fg = colors.yamabuki }
		highlights.CmpItemKindEnumMember = { fg = colors.torii_bright }
		highlights.CmpItemKindModule = { fg = colors.murasaki }
		highlights.CmpItemKindProperty = { fg = colors.bamboo }
		highlights.CmpItemKindField = { fg = colors.bamboo }
		highlights.CmpItemKindTypeParameter = { fg = colors.bamboo_forest }
		highlights.CmpItemKindUnit = { fg = colors.sakura }
		highlights.CmpItemKindText = { fg = colors.fg }
		highlights.CmpItemKindSnippet = { fg = colors.bamboo_forest }
		highlights.CmpItemKindFile = { fg = colors.fg }
		highlights.CmpItemKindFolder = { fg = colors.sumi }
		highlights.CmpItemKindColor = { fg = colors.sakura }
		highlights.CmpItemKindOperator = { fg = colors.bamboo_forest }
		highlights.CmpItemKindEvent = { fg = colors.sumi }
	end

	-- ===========================================
	-- GitSigns
	-- ===========================================
	if config.plugins.gitsigns and is_installed("gitsigns") then
		highlights.GitSignsAdd = { fg = colors.git_add }
		highlights.GitSignsChange = { fg = colors.git_change }
		highlights.GitSignsDelete = { fg = colors.git_delete }
		highlights.GitSignsChangedelete = { fg = colors.git_change }
		highlights.GitSignsTopdelete = { fg = colors.git_delete }
		highlights.GitSignsUntracked = { fg = colors.fg_gutter }

		-- Virtual text
		highlights.GitSignsAddNr = { fg = colors.git_add }
		highlights.GitSignsChangeNr = { fg = colors.git_change }
		highlights.GitSignsDeleteNr = { fg = colors.git_delete }
		highlights.GitSignsChangedeleteNr = { fg = colors.git_change }
		highlights.GitSignsTopdeleteNr = { fg = colors.git_delete }

		-- Line highlights
		highlights.GitSignsAddLn = { bg = util.darken(colors.git_add, 0.9) }
		highlights.GitSignsChangeLn = { bg = util.darken(colors.git_change, 0.9) }
		highlights.GitSignsDeleteLn = { bg = util.darken(colors.git_delete, 0.9) }

		-- Word diff
		highlights.GitSignsAddInline = { bg = util.darken(colors.git_add, 0.7) }
		highlights.GitSignsChangeInline = { bg = util.darken(colors.git_change, 0.7) }
		highlights.GitSignsDeleteInline = { bg = util.darken(colors.git_delete, 0.7) }

		-- Preview
		highlights.GitSignsAddPreview = { fg = colors.git_add, bg = util.darken(colors.git_add, 0.9) }
		highlights.GitSignsDeletePreview = { fg = colors.git_delete, bg = util.darken(colors.git_delete, 0.9) }

		-- Current line blame
		highlights.GitSignsCurrentLineBlame = { fg = colors.comment, italic = true }
	end

	-- ===========================================
	-- Indent Blankline
	-- ===========================================
	if config.plugins.indent_blankline and is_installed("indent_blankline") then
		highlights.IndentBlanklineChar = { fg = colors.bg_highlight, nocombine = true }
		highlights.IndentBlanklineContextChar = { fg = colors.murasaki, nocombine = true }
		highlights.IndentBlanklineContextStart = { underline = true, sp = colors.murasaki }
		highlights.IndentBlanklineSpaceChar = { fg = colors.bg_highlight, nocombine = true }
		highlights.IndentBlanklineSpaceCharBlankline = { fg = colors.bg_highlight, nocombine = true }

		-- v3 version
		highlights.IblIndent = { fg = colors.bg_highlight, nocombine = true }
		highlights.IblWhitespace = { fg = colors.bg_highlight, nocombine = true }
		highlights.IblScope = { fg = colors.murasaki, nocombine = true }
	end

	-- ===========================================
	-- Which Key
	-- ===========================================
	if is_installed("which-key") then
		highlights.WhichKey = { fg = colors.murasaki, bold = true }
		highlights.WhichKeyGroup = { fg = colors.sumi }
		highlights.WhichKeyDesc = { fg = colors.fg }
		highlights.WhichKeySeperator = { fg = colors.comment }
		highlights.WhichKeySeparator = { fg = colors.comment }
		highlights.WhichKeyFloat = { bg = colors.bg_dark }
		highlights.WhichKeyValue = { fg = colors.bamboo }
	end

	-- ===========================================
	-- Dashboard / Alpha
	-- ===========================================
	if is_installed("dashboard") or is_installed("alpha") then
		highlights.DashboardHeader = { fg = colors.sakura }
		highlights.DashboardCenter = { fg = colors.sumi }
		highlights.DashboardFooter = { fg = colors.murasaki }
		highlights.DashboardKey = { fg = colors.yamabuki, bold = true }
		highlights.DashboardDesc = { fg = colors.fg }
		highlights.DashboardIcon = { fg = colors.sakura, bold = true }

		-- Alpha specific
		highlights.AlphaHeader = { fg = colors.sakura }
		highlights.AlphaButtons = { fg = colors.sumi }
		highlights.AlphaFooter = { fg = colors.murasaki, italic = true }
		highlights.AlphaShortcut = { fg = colors.yamabuki, bold = true }
	end

	-- ===========================================
	-- Bufferline
	-- ===========================================
	if is_installed("bufferline") then
		highlights.BufferLineBackground = { fg = colors.fg_gutter, bg = colors.bg_dark }
		highlights.BufferLineBuffer = { fg = colors.fg_gutter, bg = colors.bg_dark }
		highlights.BufferLineBufferSelected = { fg = colors.fg, bg = colors.bg, bold = true }
		highlights.BufferLineBufferVisible = { fg = colors.fg_dark, bg = colors.bg_highlight }

		highlights.BufferLineCloseButton = { fg = colors.fg_gutter, bg = colors.bg_dark }
		highlights.BufferLineCloseButtonSelected = { fg = colors.torii, bg = colors.bg }
		highlights.BufferLineCloseButtonVisible = { fg = colors.fg_gutter, bg = colors.bg_highlight }

		highlights.BufferLineModified = { fg = colors.git_change, bg = colors.bg_dark }
		highlights.BufferLineModifiedSelected = { fg = colors.git_change, bg = colors.bg }
		highlights.BufferLineModifiedVisible = { fg = colors.git_change, bg = colors.bg_highlight }

		highlights.BufferLineSeparator = { fg = colors.bg_dark, bg = colors.bg_dark }
		highlights.BufferLineSeparatorSelected = { fg = colors.bg_dark, bg = colors.bg }
		highlights.BufferLineSeparatorVisible = { fg = colors.bg_dark, bg = colors.bg_highlight }

		highlights.BufferLineIndicatorSelected = { fg = colors.sakura, bg = colors.bg }
		highlights.BufferLineIndicatorVisible = { fg = colors.bg, bg = colors.bg }

		highlights.BufferLineFill = { bg = colors.black }
		highlights.BufferLineTab = { fg = colors.fg_gutter, bg = colors.bg_dark }
		highlights.BufferLineTabSelected = { fg = colors.fg, bg = colors.bg }
		highlights.BufferLineTabClose = { fg = colors.torii, bg = colors.bg_dark }
	end

	-- ===========================================
	-- Notify
	-- ===========================================
	if is_installed("notify") then
		highlights.NotifyERRORBorder = { fg = colors.diag_error }
		highlights.NotifyERRORIcon = { fg = colors.diag_error }
		highlights.NotifyERRORTitle = { fg = colors.diag_error, bold = true }
		highlights.NotifyWARNBorder = { fg = colors.diag_warning }
		highlights.NotifyWARNIcon = { fg = colors.diag_warning }
		highlights.NotifyWARNTitle = { fg = colors.diag_warning, bold = true }
		highlights.NotifyINFOBorder = { fg = colors.diag_info }
		highlights.NotifyINFOIcon = { fg = colors.diag_info }
		highlights.NotifyINFOTitle = { fg = colors.diag_info, bold = true }
		highlights.NotifyDEBUGBorder = { fg = colors.comment }
		highlights.NotifyDEBUGIcon = { fg = colors.comment }
		highlights.NotifyDEBUGTitle = { fg = colors.comment, bold = true }
		highlights.NotifyTRACEBorder = { fg = colors.murasaki }
		highlights.NotifyTRACEIcon = { fg = colors.murasaki }
		highlights.NotifyTRACETitle = { fg = colors.murasaki, bold = true }

		highlights.NotifyBackground = { bg = colors.bg }
	end

	-- ===========================================
	-- Hop / Leap
	-- ===========================================
	if is_installed("hop") or is_installed("leap") then
		highlights.HopNextKey = { fg = colors.torii, bold = true }
		highlights.HopNextKey1 = { fg = colors.sumi, bold = true }
		highlights.HopNextKey2 = { fg = colors.bamboo }
		highlights.HopUnmatched = { fg = colors.fg_gutter }
		highlights.HopPreview = { fg = colors.yamabuki, bold = true }

		-- Leap
		highlights.LeapMatch = { fg = colors.torii, bold = true, underline = true }
		highlights.LeapLabelPrimary = { fg = colors.bg, bg = colors.torii, bold = true }
		highlights.LeapLabelSecondary = { fg = colors.bg, bg = colors.sumi, bold = true }
		highlights.LeapBackdrop = { fg = colors.fg_gutter }
	end

	-- ===========================================
	-- Noice (UI replacement)
	-- ===========================================
	if is_installed("noice") then
		highlights.NoiceCmdlinePopup = { bg = colors.bg_dark }
		highlights.NoiceCmdlinePopupBorder = { fg = colors.murasaki }
		highlights.NoiceCmdlinePopupTitle = { fg = colors.murasaki, bold = true }
		highlights.NoiceCmdlineIcon = { fg = colors.murasaki }

		highlights.NoiceCmdlinePopupBorderHelp = { fg = colors.sakura_dark }
		highlights.NoiceCmdlineIconHelp = { fg = colors.sakura_dark }
		highlights.NoiceCmdlinePopupBorderLua = { fg = colors.sumi }
		highlights.NoiceCmdlineIconLua = { fg = colors.sumi }

		highlights.NoiceMini = { bg = colors.bg_highlight }
		highlights.NoiceConfirm = { bg = colors.bg_dark }
		highlights.NoiceConfirmBorder = { fg = colors.bamboo_forest }

		highlights.NoiceFormatProgressDone = { bg = colors.bamboo }
		highlights.NoiceFormatProgressTodo = { bg = colors.bg_highlight }

		highlights.NoiceLspProgressClient = { fg = colors.murasaki }
		highlights.NoiceLspProgressSpinner = { fg = colors.bamboo }
		highlights.NoiceLspProgressTitle = { fg = colors.fg }
	end

	-- ===========================================
	-- Trouble
	-- ===========================================
	if is_installed("trouble") then
		highlights.TroubleText = { fg = colors.fg }
		highlights.TroubleCount = { fg = colors.murasaki, bg = colors.bg_highlight }
		highlights.TroubleNormal = { fg = colors.fg, bg = colors.bg_dark }
		highlights.TroubleLocation = { fg = colors.comment }
		highlights.TroubleIndent = { fg = colors.bg_highlight }
		highlights.TroubleFoldIcon = { fg = colors.murasaki }
		highlights.TroubleCode = { fg = colors.comment }
		highlights.TroubleSource = { fg = colors.comment }
		highlights.TroubleFile = { fg = colors.sumi }
		highlights.TroubleSignError = { fg = colors.diag_error }
		highlights.TroubleSignWarning = { fg = colors.diag_warning }
		highlights.TroubleSignInformation = { fg = colors.diag_info }
		highlights.TroubleSignHint = { fg = colors.diag_hint }
	end

	-- ===========================================
	-- Mini.Statusline
	-- ===========================================
	if is_installed("mini.statusline") then
		highlights.MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.yamabuki, bold = true }
		highlights.MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.bamboo, bold = true }
		highlights.MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.sakura_dark, bold = true }
		highlights.MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.murasaki, bold = true }
		highlights.MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.torii, bold = true }
	end

	return highlights
end

function M.get_lualine_theme()
	local colors = require("shizukana.colors").get_colors()
	return M.lualine_theme or {}
end

return M
