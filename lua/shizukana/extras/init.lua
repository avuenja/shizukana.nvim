local M = {}

-- Get the path to extras directory
local function get_extras_path()
	local config_path = vim.fn.stdpath("config")
	return config_path .. "/shizukana-extras"
end

-- Ensure directory exists
local function ensure_dir(path)
	vim.fn.mkdir(path, "p")
end

-- Write content to file
local function write_file(path, content)
	local file = io.open(path, "w")
	if file then
		file:write(content)
		file:close()
		return true
	end
	return false
end

-- Generate all extras for a given style
function M.generate(style)
	style = style or "moon"
	local colors = require("shizukana.palette").get_colors(style)
	local extras_path = get_extras_path()

	ensure_dir(extras_path)

	-- Generate each extra
	local generators = {
		require("shizukana.extras.alacritty"),
		require("shizukana.extras.ghostty"),
		require("shizukana.extras.wezterm"),
		require("shizukana.extras.kitty"),
		require("shizukana.extras.fish"),
		require("shizukana.extras.starship"),
		require("shizukana.extras.base16"),
		require("shizukana.extras.windows_terminal"),
		require("shizukana.extras.tmux"),
	}

	local generated = {}

	for _, generator in ipairs(generators) do
		local ok, filename = pcall(generator.filename, style)
		if ok then
			local ok2, content = pcall(generator.generate, colors, style)
			if ok2 then
				local filepath = extras_path .. "/" .. filename
				if write_file(filepath, content) then
					table.insert(generated, filepath)
				end
			else
				vim.notify("Failed to generate " .. filename .. ": " .. tostring(content), vim.log.levels.ERROR, {
					title = "Shizukana Extras Error",
				})
			end
		end
	end

	vim.notify(
		string.format("Generated %d extras for %s in %s", #generated, style, extras_path),
		vim.log.levels.INFO,
		{ title = "Shizukana Extras" }
	)

	return generated
end

-- Generate extras for all styles
function M.generate_all()
	local styles = { "moon", "dawn", "dusk" }
	local total = 0

	for _, style in ipairs(styles) do
		local generated = M.generate(style)
		total = total + #generated
	end

	vim.notify(
		string.format("Generated %d total extras for all styles", total),
		vim.log.levels.INFO,
		{ title = "Shizukana Extras" }
	)
end

return M
