# coocobolo.nvim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[Dark theme](https://github.com/Kbgjtn/coocobolo.nvim/blob/main/docs/coocobolo.nvim.gif)

## Usage

A minimal Neovim colorscheme with customizable accent colors, light/dark themes, and highlight/palette overrides.

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

## [vim-plug](https://github.com/junegunn/vim-plug)

```vim
call plug#begin('~/.vim/plugged')
Plug 'coocobolo/coocobolo.nvim', { 'branch': 'master' }
call plug#end()
```

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

### vim colorscheme configuration (.vimrc)

```vim
" default configuration
set background=dark

" Apply the Colorscheme
" set this value will apply default configuration
colorscheme coocobolo
```

```vim
" default configuration
set background=dark

" Apply the Colorscheme
" set this value will apply default configuration
colorscheme coocobolo

" Override the config

" Theme
" Choose the base palette for the colorscheme.
" Options:
"   'dark'     - Dark theme (default)
"   'colorful' - Light/Colorful theme
let g:coocobolo_theme = 'dark'

" Accent Colors
" Define the accent colors used throughout the theme.
" Use a comma-separated string of hex color codes.
let g:coocobolo_accent_colors = '#7A7B4C,#E3635F,#FFD93D,#00BFFF,#D79FC7,#00CED1,#FFB000,#FF8DA1'

" Default accent color if not randomizing
let g:coocobolo_accent_default = '#B6B6B6'

" Enable random selection of accent colors from the list (0 = false, 1 = true)
let g:coocobolo_accent_randomize = 0


" Custom Palette Overrides
" Override any colors from the default palette.
" Only set the fields you want to change; leave others as empty strings.
" Fields include:
"   bg, fg, primary, primary_2, primary_3, primary_4, primary_5, primary_6,
"   red, green, blue, yellow
let g:coocobolo_custom_palette = {
      \ 'bg': '',          " Background color
      \ 'fg': '',          " Foreground color
      \ 'primary': '',     " Primary UI color
      \ 'primary_2': '',   " Secondary primary
      \ 'primary_3': '',   " Tertiary primary
      \ 'primary_4': '',   " Quaternary primary
      \ 'primary_5': '',   " Quinary primary
      \ 'primary_6': '',   " Senary primary
      \ 'red': '#F26E5A',  " Red
      \ 'green': '',       " Green
      \ 'blue': '#057DCD', " Blue
      \ 'yellow': '',      " Yellow
      \ }


" Custom Highlight Groups
" Add or override highlight groups using Vim's 'hi' attributes.
" Fields:
"   fg   - Foreground color (#hex)
"   bg   - Background color (#hex)
"   gui  - Text style: bold, italic, underline, undercurl
let g:coocobolo_custom_highlights = {
      \ 'Normal':  {'fg': '#474747', 'bg': '#101010', 'gui': 'bold'},
      \ 'Comment': {'fg': '#888888', 'gui': 'italic'},
      \ 'CursorLine': {'bg': '#202020'},
      \ }


" Apply the Colorscheme
" Always apply the colorscheme after all configuration variables are set.
colorscheme coocobolo
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

- [x] support for vim
- [ ] re-check groups color matching in vim version
