# 🌸 shizukana.nvim

A modern, soothing Neovim theme inspired by traditional Japanese aesthetics, focusing on visual comfort and accessibility.

![Neovim 0.9+](https://img.shields.io/badge/Neovim-0.9%2B-green.svg)
![Lua](https://img.shields.io/badge/Lua-100%25-blue.svg)
![WCAG AAA](https://img.shields.io/badge/WCAG-AAA-brightgreen.svg)

<img width="2586" height="1818" alt="Shizukana - Moon" src="https://github.com/user-attachments/assets/f8b7e0a9-aedb-4d06-a367-f35b81f71809" />
<img width="2586" height="1818" alt="Shizukana - Dawn" src="https://github.com/user-attachments/assets/d5e19119-7037-4e00-862f-155831dce4c3" />

## ✨ Features

- 🎨 **Authentic Japanese Palette**: Colors inspired by sakura, torii, bamboo and traditional elements
- 👁️ **Visual Comfort**: Developed with color science to reduce eye strain
- ♿ **WCAG AAA Accessibility**: 7:1 contrast ratio for maximum readability
- 🌙 **Multiple Styles**: Moon (dark), Dawn (light), Dusk (twilight)
- 🔧 **TreeSitter & LSP**: Full support for modern semantic highlighting
- 🎯 **Dim Inactive**: Smart highlighting for active window
- 🔌 **10+ Plugins**: Integration with Telescope, Lualine, nvim-tree and more
- 🚀 **Performance**: Modular architecture with lazy loading

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "avuenja/shizukana.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("shizukana").setup({
      -- your config here
    })
    vim.cmd.colorscheme("shizukana")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "avuenja/shizukana.nvim",
  config = function()
    require("shizukana").setup({
      -- your config here
    })
    vim.cmd.colorscheme("shizukana")
  end,
}
```

## ⚙️ Configuration

```lua
require("shizukana").setup({
  style = "moon",        -- "moon" | "dawn" | "dusk"
  transparent = false,   -- Transparent background
  terminal_colors = true, -- Set terminal colors

  dim_inactive = {
    enabled = true,      -- Dim inactive windows
    shade = "dark",
    percentage = 0.12,   -- 12% darker
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
    auto_detect = true,  -- Auto-detect installed plugins
    telescope = true,
    nvim_tree = true,
    lualine = true,
    treesitter = true,
    lsp = true,
    cmp = true,
    gitsigns = true,
    indent_blankline = true,
  },

  -- Advanced callbacks
  on_colors = function(colors)
    -- Modify colors before applying
    -- colors.bg = "#1a1a1a"
  end,

  on_highlights = function(highlights, colors)
    -- Add custom highlights
    -- highlights.MyCustomHL = { fg = colors.sakura }
  end,
})
```

## 🎨 Color Palette

### Moon (Dark Mode)

| Color | Hex       | Name     | Usage                  |
| ----- | --------- | -------- | ---------------------- |
| 🌸    | `#ffc0d9` | Sakura   | Numbers, booleans      |
| ⛩️    | `#ff757f` | Torii    | Errors, constants      |
| 🎋    | `#9ece6a` | Bamboo   | Strings, git additions |
| 💠    | `#7aa2f7` | Sumi     | Functions, links       |
| 🟣    | `#bb9af7` | Murasaki | Keywords, statements   |
| 🌕    | `#e0af68` | Yamabuki | Types, warnings        |

### Dawn (Light Mode)

| Color | Hex       | Name     | Usage                  |
| ----- | --------- | -------- | ---------------------- |
| 🌸    | `#b4637a` | Sakura   | Numbers, booleans      |
| ⛩️    | `#d20f39` | Torii    | Errors, constants      |
| 🎋    | `#568a3a` | Bamboo   | Strings, git additions |
| 💠    | `#286983` | Sumi     | Functions, links       |
| 🟣    | `#907aa9` | Murasaki | Keywords, statements   |
| 🌕    | `#ea9d34` | Yamabuki | Types, warnings        |

### Dusk (Twilight Mode)

| Color | Hex       | Name     | Usage                  |
| ----- | --------- | -------- | ---------------------- |
| 🌸    | `#d4a5b5` | Sakura   | Numbers, booleans      |
| ⛩️    | `#e06b74` | Torii    | Errors, constants      |
| 🎋    | `#8fb573` | Bamboo   | Strings, git additions |
| 💠    | `#6494c4` | Sumi     | Functions, links       |
| 🟣    | `#a594c7` | Murasaki | Keywords, statements   |
| 🌕    | `#d4a76a` | Yamabuki | Types, warnings        |

## 🛠️ Built-in Commands

```vim
:ShizukanaReload    " Reload theme (useful during development)
:ShizukanaPalette   " Show all palette colors
:ShizukanaContrast  " Check WCAG contrast for all colors
:ShizukanaStyle     " Toggle between moon/dawn/dusk
:ShizukanaExtras    " Generate all extras passing style
:ShizukanaExtrasAll " Generate all extras to all styles (base16, starship, etc.)
```

## 📚 Project Structure

```
shizukana.nvim/
├── lua/
│   └── shizukana/
│       ├── init.lua          # Theme core
│       ├── palette.lua       # Color definitions
│       ├── util.lua          # Utility functions
│       └── groups/
│           ├── init.lua      # Base highlights
│           ├── treesitter.lua # TreeSitter groups
│           ├── lsp.lua       # LSP semantic tokens
│           └── plugins.lua   # Plugin integrations
└── colors/
    └── shizukana.lua      # Entry point
```

## 🔬 Science Behind the Theme

### WCAG Accessibility

- **AAA Standard**: Minimum 7:1 contrast ratio for normal text
- **AA Standard**: Minimum 4.5:1 contrast (exceeded by all colors)
- Relative luminance algorithm implemented for validation

### Visual Comfort

- **Background #1a1b26**: Avoids pure black to reduce excessive contrast
- **Pastel Colors**: Reduces visual vibration and halation
- **Color Temperature**: Optimized between 2700K-4000K for comfort

### Japanese Inspiration

- **Sakura (桜)**: Soft pink of cherry blossoms
- **Torii (鳥居)**: Sacred red of Shinto gates
- **Yamabuki (山吹)**: Golden yellow of yamabuki flowers
- **Bamboo (竹)**: Green of young bamboo
- **Sumi (墨)**: Blue of traditional ink
- **Murasaki (紫)**: Historical noble purple

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing`)
5. Open a Pull Request

## 📝 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Inspired by Japanese culture and aesthetics
- Based on WCAG accessibility research
- Influenced by themes like [tokyonight.nvim](https://github.com/folke/tokyonight.nvim), [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim), and [catppuccin](https://github.com/catppuccin/nvim)

---

<div align="center">

**Made with 🌸 for developers who value their eyes**

[Report Bug](https://github.com/avuenja/shizukana.nvim/issues) •
[Request Feature](https://github.com/avuenja/shizukana.nvim/issues)

</div>
