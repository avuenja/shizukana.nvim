-- Tmux theme generator

local M = {}

function M.filename(style)
	return "tmux-shizukana-" .. style .. ".conf"
end

function M.generate(colors, style)
	local template = [[
# Shizukana Theme for Tmux (%s)
# Generated automatically - do not edit

# Status bar
set -g status-style "bg=%s,fg=%s"
set -g status-left-style "bg=%s,fg=%s,bold"
set -g status-right-style "bg=%s,fg=%s"

# Window status
set -g window-status-style "bg=%s,fg=%s"
set -g window-status-current-style "bg=%s,fg=%s,bold"
set -g window-status-activity-style "bg=%s,fg=%s"
set -g window-status-bell-style "bg=%s,fg=%s,bold"

# Pane borders
set -g pane-border-style "fg=%s"
set -g pane-active-border-style "fg=%s"

# Message style
set -g message-style "bg=%s,fg=%s,bold"
set -g message-command-style "bg=%s,fg=%s"

# Copy mode
set -g mode-style "bg=%s,fg=%s"

# Clock
set -g clock-mode-colour "%s"

# Status bar format examples
set -g status-left " #[fg=%s,bold]#S #[fg=%s]❯ "
set -g status-right "#[fg=%s] %%H:%%M #[fg=%s]❯#[fg=%s] %%d %%b #[fg=%s,bg=%s,bold] #h "

# Window status format
set -g window-status-format "#[fg=%s] #I:#W#F "
set -g window-status-current-format "#[fg=%s,bg=%s,bold] #I:#W#F "

# Set terminal titles
set -g set-titles on
set -g set-titles-string '#h ❯ #S ● #W'

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity off
]]

	return string.format(
		template,
		style,
		-- Status bar
		colors.bg_dark,
		colors.fg,
		colors.bg_highlight,
		colors.murasaki,
		colors.bg_dark,
		colors.fg_dark,
		-- Window status
		colors.bg_dark,
		colors.fg_gutter,
		colors.bg,
		colors.fg,
		colors.bg_highlight,
		colors.yamabuki,
		colors.torii,
		colors.fg,
		-- Pane borders
		colors.bg_highlight,
		colors.murasaki,
		-- Message
		colors.bg_highlight,
		colors.fg,
		colors.bg_dark,
		colors.fg_dark,
		-- Copy mode
		colors.bg_highlight,
		colors.fg,
		-- Clock
		colors.sumi,
		-- Status format colors
		colors.sakura,
		colors.fg_dark,
		colors.fg_gutter,
		colors.fg_dark,
		colors.bamboo,
		colors.black,
		colors.bg_highlight,
		-- Window format colors
		colors.fg_gutter,
		colors.fg,
		colors.bg_highlight
	)
end

return M
