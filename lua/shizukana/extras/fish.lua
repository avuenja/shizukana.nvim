-- Fish shell theme generator

local M = {}

function M.filename(style)
	return "fish-shizukana-" .. style .. ".fish"
end

function M.generate(colors, style)
	-- Helper to remove # from hex colors
	local function clean_hex(hex)
		return hex:gsub("#", "")
	end

	local template = [[
#!/usr/bin/fish
# Shizukana Fish shell theme (%s)
# Based on the Shizukana color palette
# Generated automatically - do not edit

# Color definitions using your palette
set -l foreground %s normal
set -l background %s normal
set -l selection %s normal
set -l comment %s normal
set -l red %s red
set -l orange %s brred
set -l yellow %s yellow
set -l green %s green
set -l purple %s magenta
set -l cyan %s cyan
set -l blue %s blue
set -l pink %s brmagenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_keyword $purple
set -g fish_color_quote $green
set -g fish_color_redirection $cyan
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $foreground
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $yellow
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# Directory and file colors
set -g fish_color_cwd $blue
set -g fish_color_cwd_root $red
set -g fish_color_host $cyan
set -g fish_color_user $green
set -g fish_color_valid_path --underline

# History and search
set -g fish_color_history_current $pink
set -g fish_color_match $yellow

# Git prompt colors (if using git integration)
set -g __fish_git_prompt_color_branch $purple
set -g __fish_git_prompt_color_dirtystate $red
set -g __fish_git_prompt_color_stagedstate $yellow
set -g __fish_git_prompt_color_untrackedfiles $orange
set -g __fish_git_prompt_color_cleanstate $green

# Additional customization
set -g fish_color_cancel $red
set -g fish_color_option $cyan

# Enable colored output for common commands
if type -q ls
    alias ls 'ls --color=auto'
end
if type -q grep
    alias grep 'grep --color=auto'
end
if type -q diff
    alias diff 'diff --color=auto'
end
]]

	return string.format(
		template,
		style,
		-- Color definitions
		clean_hex(colors.fg),
		clean_hex(colors.bg),
		clean_hex(colors.bg_highlight),
		clean_hex(colors.comment),
		clean_hex(colors.torii),
		clean_hex(colors.torii_bright),
		clean_hex(colors.yamabuki),
		clean_hex(colors.bamboo),
		clean_hex(colors.murasaki),
		clean_hex(colors.bamboo_forest),
		clean_hex(colors.sumi),
		clean_hex(colors.sakura),
		style
	)
end

return M
