-- Starship prompt theme generator

local M = {}

function M.filename(style)
	return "starship-shizukana-" .. style .. ".toml"
end

function M.generate(colors, style)
	local template = [[
# Shizukana Theme for Starship (%s)
# Generated automatically - do not edit

"$schema" = 'https://starship.rs/config-schema.json'

format = """
[░▒▓](color_red)\
$os\
$username\
[](bg:color_cyan fg:color_red)\
$directory\
[](fg:color_cyan bg:color_orange)\
$git_branch\
$git_status\
[](fg:color_orange bg:color_yellow)\
$c\
$cpp\
$rust\
$kotlin\
$haskell\
[](fg:color_yellow bg:color_blue)\
$php\
$java\
$golang\
[](fg:color_blue bg:color_green)\
$nodejs\
$python\
[](fg:color_green bg:color_bg3)\
$docker_context\
$conda\
[](fg:color_bg3 bg:color_bg1)\
$time\
[▓▒░ ](fg:color_bg1)\
$line_break$character"""

palette = 'shizukana_%s'

[palettes.shizukana_%s]
# Main colors for the theme
color_fg0 = '%s' # main text
color_fg1 = '%s' # secondary text
color_bg0 = '%s' # darkest background
color_bg1 = '%s' # main background
color_bg2 = '%s' # medium background
color_bg3 = '%s' # light background/borders

# Highlight colors
color_red = '%s'    # red
color_green = '%s'  # green
color_yellow = '%s' # yellow/gold
color_blue = '%s'   # blue
color_purple = '%s' # purple/pink
color_cyan = '%s'   # cyan
color_orange = '%s' # orange/peach

# Bright/alternative colors
color_bright_red = '%s'
color_bright_green = '%s'
color_bright_yellow = '%s'
color_bright_blue = '%s'
color_bright_purple = '%s'
color_bright_cyan = '%s'

# Git/Diff specific colors
color_git_add = '%s'
color_git_change = '%s'
color_git_delete = '%s'

# Comments and details colors
color_comment = '%s'
color_wave_blue = '%s' # popups/floats

[os]
disabled = false
style = "bg:color_red fg:color_fg0"
format = '[ $symbol]($style)'

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
Artix = "󰣇"
EndeavourOS = ""
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"
Pop = ""

[username]
show_always = true
style_user = "bg:color_red fg:color_fg0"
style_root = "bg:color_red fg:color_fg0"
format = '[ $user ]($style)'

[directory]
truncation_length = 3
truncation_symbol = "…/"
style = "fg:color_bg0 bg:color_cyan"
format = "[ $path ]($style)"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
format = '[ $symbol$branch(:$remote_branch)]($style)'
style = 'bg:color_orange fg:color_bg0'
symbol = '󰘬 '
truncation_length = 21

[git_status]
format = '[ $all_status$ahead_behind ]($style)'
style = 'bg:color_orange fg:color_bg0'

[c]
symbol = " "
style = 'bg:color_yellow fg:color_bg0'
format = '[ $symbol ($version) ]($style)'

[cpp]
symbol = " "
style = 'bg:color_yellow fg:color_bg0'
format = '[ $symbol ($version) ]($style)'

[rust]
symbol = '󱘗'
style = 'bg:color_yellow fg:color_bg0'
format = '[ $symbol ($version) ]($style)'

[kotlin]
symbol = ""
style = 'bg:color_yellow fg:color_bg0'
format = '[ $symbol ($version) ]($style)'

[haskell]
symbol = ""
style = 'bg:color_yellow fg:color_bg0'
format = '[ $symbol ($version) ]($style)'

[php]
symbol = ''
format = '[ $symbol ($version) ]($style)'
style = 'bg:color_blue fg:color_bg0'

[java]
symbol = ""
format = '[ $symbol ($version) ]($style)'
style = 'bg:color_blue fg:color_bg0'

[golang]
symbol = ""
format = '[ $symbol ($version) ]($style)'
style = 'bg:color_blue fg:color_bg0'

[nodejs]
symbol = ""
format = '[ $symbol($version) ]($style)'
style = 'bg:color_green fg:color_bg0'
not_capable_style = 'bg:color_red fg:color_fg0'

[python]
symbol = ""
format = '[ $symbol($version) ]($style)'
style = 'bg:color_green fg:color_bg0'

[docker_context]
symbol = ""
format = '[ $symbol( $context) ]($style)'
style = 'bg:color_bg3 fg:color_bg0'

[conda]
format = '[ $symbol( $environment) ]($style)'
style = 'bg:color_bg3 fg:color_bg0'

[time]
disabled = false
time_format = "%%R"
style = 'bg:color_wave_blue fg:color_fg0'
format = '[  $time ]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:color_green)'
error_symbol = '[](bold fg:color_red)'
vimcmd_symbol = '[](bold fg:color_green)'
vimcmd_replace_one_symbol = '[](bold fg:color_purple)'
vimcmd_replace_symbol = '[](bold fg:color_purple)'
vimcmd_visual_symbol = '[](bold fg:color_yellow)'
]]

	local util = require("shizukana.util")

	return string.format(
		template,
		style,
		style,
		style,
		-- Main colors
		colors.fg,
		colors.fg_dark,
		colors.black,
		colors.bg_dark,
		colors.bg_highlight,
		colors.fg_gutter,
		-- Highlight colors
		util.darken(colors.torii, 0.3),
		colors.bamboo_dark,
		colors.yamabuki,
		colors.sumi,
		colors.murasaki,
		colors.bamboo_forest,
		util.darken(colors.torii_bright, 0.2),
		-- Bright colors
		colors.red_br or colors.torii,
		colors.green_br or colors.bamboo,
		colors.yellow_br or colors.yamabuki,
		colors.blue_br or colors.sumi_light,
		colors.magenta_br or colors.sakura,
		colors.cyan_br or colors.bamboo_forest,
		-- Git colors
		colors.git_add,
		colors.git_change,
		colors.git_delete,
		-- Comments and details
		colors.comment,
		colors.bg_highlight
	)
end

return M
