# coocobolo.nvim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A minimal Neovim colorscheme with customizable accent colors, light/dark themes, and highlight/palette overrides.

![Dark theme](https://github.com/coocobolo/coocobolo.nvim/blob/main/docs/coocobolo.nvim.gif)



## Supports:

- Accent color system with predefined palette (green, red, yellow, etc..) or set your own accent colors
- Option to set a default accent or randomize on startup.
- Supports both **dark** and **light** themes.
- Dim inactive windows for better focus.
- Yank highlight support (customizable via `YankHighlight` group).
- Clear statusline option to hide vertical/horizontal separators.
- Custom palette overrides for fine‑grained control.
- Highlight group overrides for advanced customization.

## Installation:

## [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
-- using packer
use "coocobolo/coocobolo.nvim"
```

## [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "coocobolo/coocobolo.nvim",
  priority = 1,
  opts = {
    accent = {
      colors = {
        "#7A7B4C", -- green
        "#E3635F", -- red
        "#FFD93D", -- yellow
        "#00BFFF", -- blue
        "#D79FC7", -- purple
        "#00CED1", -- teal
        "#FFB000", -- orange
        "#FF8DA1", -- pink
      },
      default = "#7A7B4C",
      randomize = false,
    },
    theme = "dark", -- "dark" or "light"
    dim_inactive = false,
    enable_yank_highlight = true, -- highlight group name [YankHighlight] if want to custom
    clear_status_line = true, -- hide and clear vertical and horizontal status_line
    custom_palette = {
      -- override palette
      -- bg = "#000000",
      -- fg = "#000000",
      -- primary = "#000000",
      -- red = "#000000",
      -- green = "#000000",
      -- blue = "#000000",
      -- yellow = "#000000",
    },
    highlights = {
      -- override highlight group
      -- Normal = { bg = "#101010", fg = "#474747", bold = true },
    },
  },
}
```

## Configuration

- Accent colors: Choose from the provided palette or add your own.
- Theme: Switch between "dark" and "light".
- Dim inactive: Set inactive windows to dim for focus.
- Yank highlight: Enable highlight when yanking text.
- Clear statusline: Hide vertical/horizontal separators for a cleaner look.
- Custom palette: Override base colors.
- Highlights: Override specific highlight groups.

## Example

```lua
    vim.cmd.colorscheme("coocobolo")
```

## TODO

- [ ] support for vim
- [ ] cover other plugins
