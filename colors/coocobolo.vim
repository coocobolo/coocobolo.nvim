" Vim colorscheme
" Name: coocobolo
" Maintainer: @coocobolo (coocoobolo1@gmail.com)
" [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

" Theme selection
let g:coocobolo_theme = 'dark'        " 'dark' or 'colorful'

" Accent colors (comma-separated string)
let g:coocobolo_accent_colors = '#7A7B4C,#E3635F,#FFD93D,#00BFFF,#D79FC7,#00CED1,#FFB000,#FF8DA1'
let g:coocobolo_accent_default = '#7A7B4C'
let g:coocobolo_accent_randomize = 0

" Custom palette overrides
let g:coocobolo_custom_palette = {'bg': '', 'fg': '', 'primary': '', 'red': '', 'green': '', 'blue': '', 'yellow': ''}

" Highlights overrides
let g:coocobolo_custom_highlights = {}

" Dark palette
let g:coocobolo_dark = {
\ 'theme': 'dark',
\ 'none': 'NONE',
\ 'bg': '#000000',
\ 'fg': '#444443',
\ 'primary': '#161616',
\ 'primary_2': '#353535',
\ 'primary_3': '#605F5E',
\ 'primary_4': '#8E8C8A',
\ 'primary_5': '#A5A09E',
\ 'primary_6': '#B1ADAB',
\ 'red': '#E3635F',
\ 'green': '#7A7B4C',
\ 'blue': '#00BFFF',
\ 'yellow': '#FFC436',
\ 'accent': '#7A7B4C',
\ }

" Colorful palette
let g:coocobolo_colorful = {
\ 'theme': 'light',
\ 'none': 'NONE',
\ 'bg': '#BAB8B4',
\ 'fg': '#000000',
\ 'primary': '#AEABA7',
\ 'primary_2': '#707070',
\ 'primary_3': '#303030',
\ 'primary_4': '#606060',
\ 'primary_5': '#555555',
\ 'primary_6': '#474747',
\ 'red': '#E3635F',
\ 'green': '#8A8635',
\ 'blue': '#00BFFF',
\ 'yellow': '#FFBF00',
\ 'accent': '#8A8635',
\ }

function! CoocoboloSetPalette(name)
    if a:name ==# 'dark'
        let s:current = g:coocobolo_dark
    elseif a:name ==# 'colorful'
        let s:current = g:coocobolo_colorful
    else
        echo "Unknown palette: " . a:name
        return
    endif

    " Apply highlights
    execute 'hi clear'
    if exists('syntax_on')
        syntax reset
    endif

    let g:colors_name = 'coocobolo'

    " Apply user custom palette overrides
    for [key, val] in items(g:coocobolo_custom_palette)
        if val != ''
            let s:current[key] = val
        endif
    endfor

    " Pick accent color
    if g:coocobolo_accent_randomize
        let accent_list = split(g:coocobolo_accent_colors, ',')
        let s:current.accent = accent_list[rand() % len(accent_list)]
    else
        let s:current.accent = g:coocobolo_accent_default
    endif

    let s:groups = {
    \ 'Normal': {'fg': s:current.fg, 'bg': s:current.bg}, 
    \ 'Visual': {'fg': s:current.none, 'bg': s:current.primary, 'gui': 'bold'},
    \ 'YankHighlight': {'fg': s:current.primary_5, 'gui': 'bold'},
    \ 'lCursor': {'fg': s:current.none, 'bg': s:current.none},
    \ 'TermCursor': {'fg': s:current.none, 'bg': s:current.accent},
    \ 'Cursor': {'fg': s:current.red, 'bg': s:current.accent},
    \ 'CursorColumn': {'fg': s:current.none, 'bg': s:current.primary},
    \ 'CursorIM': {'fg': s:current.none},
    \ 'CursorLine': {'fg': s:current.none, 'bg': s:current.primary},
    \ 'CursorLineSign': {'fg': s:current.bg},
    \ 'SignColumn': {'fg': s:current.fg, 'bg': s:current.bg},
    \ 'CursorLineNr': {'fg': s:current.accent},
    \ 'CursorLineFold': {'fg': s:current.accent},
    \ 'EndOfBuffer': {'fg': s:current.bg, 'bg': s:current.bg},
    \ 'Title': {'fg': s:current.primary_4, 'gui': 'bold'},
    \ 'Bold': {'fg': s:current.primary_4, 'gui': 'bold'},
    \ 'LineNr': {'fg': s:current.primary_2, 'bg': s:current.bg},
    \ 'FloatBorder': {'fg': s:current.primary, 'gui': 'bold'},
    \ 'FloatTitle': {'fg': s:current.primary_2},
    \ 'StatusLine': {'fg': s:current.fg, 'bg': s:current.bg},
    \ 'TabLine': {'fg': s:current.fg, 'bg': s:current.bg},
    \ 'TabLineSel': {'fg': s:current.primary_3, 'bg': s:current.bg},
    \ 'TabLineFill': {'fg': s:current.primary_3, 'bg': s:current.bg},
    \ 'StatusLineNC': {'fg': s:current.fg, 'bg': s:current.bg},
    \ 'StatusLineTerm': {'fg': s:current.fg, 'bg': s:current.bg},
    \ 'VertSplit': {'fg': s:current.bg, 'bg': s:current.bg},
    \ 'Directory': {'fg': s:current.primary_3},
    \ 'WinSeparator': {'fg': s:current.bg, 'bg': s:current.bg},
    \ 'Error': {'fg': s:current.red},
    \ 'ErrorMsg': {'fg': s:current.red},
    \ 'WarningMsg': {'fg': s:current.yellow},
    \ 'Todo': {'fg': s:current.primary_6},
    \ 'CurSearch': {'fg': s:current.accent, 'bg': s:current.none, 'gui': 'bold'},
    \ 'Search': {'fg': s:current.accent, 'bg': s:current.none},
    \ 'IncSearch': {'fg': s:current.accent, 'gui': 'bold'},
    \ 'Folded': {'fg': s:current.primary_2, 'gui': 'bold'},
    \ 'FoldColumn': {'fg': s:current.primary_2},
    \ 'ModeMsg': {'fg': s:current.accent},
    \ 'MoreMsg': {'fg': s:current.accent},
    \ 'Question': {'fg': s:current.primary_2},
    \ 'NormalFloat': {'bg': s:current.bg},
    \ 'Pmenu': {'bg': s:current.none},
    \ 'PmenuThumb': {'bg': s:current.none},
    \ 'PmenuSel': {'fg': s:current.bg, 'bg': s:current.accent},
    \ 'Type': {'fg': s:current.primary_4},
    \ 'String': {'fg': s:current.primary_3},
    \ 'Comment': {'fg': s:current.primary_2},
    \ 'Special': {'fg': s:current.primary_3},
    \ 'Constant': {'fg': s:current.primary_3},
    \ 'Statement': {'fg': s:current.primary_4},
    \ 'Function': {'fg': s:current.primary_5, 'gui': 'bold'},
    \ 'Operator': {'fg': s:current.primary_2, 'gui': 'bold'},
    \ 'Delimiter': {'fg': s:current.primary_2, 'gui': 'bold'},
    \ 'Underlined': {'fg': s:current.primary_3, 'gui': 'underline'},
    \ 'Identifier': {'fg': s:current.accent},
    \ 'DiagnosticSignError': {'fg': s:current.red},
    \ 'DiagnosticSignWarn': {'fg': s:current.yellow},
    \ 'DiagnosticHint': {'fg': s:current.primary_4},
    \ 'DiagnosticError': {'fg': s:current.red, 'bg': s:current.none},
    \ 'DiagnosticWarn': {'fg': s:current.yellow, 'bg': s:current.none},
    \ 'DiagnosticInfo': {'fg': s:current.primary_6, 'bg': s:current.none},
    \ 'DiagnosticVirtualTextError': {'fg': s:current.red, 'bg': s:current.none},
    \ 'DiagnosticVirtualLinesError': {'fg': s:current.red, 'bg': s:current.none},
    \ 'DiagnosticVirtualTextWarn': {'fg': s:current.yellow, 'bg': s:current.none},
    \ 'DiagnosticVirtualLinesWarn': {'fg': s:current.yellow, 'bg': s:current.none},
    \ 'DiagnosticUnderlineError': {'gui': 'undercurl', 'guisp': s:current.red},
    \ 'DiagnosticUnderlineWarn': {'gui': 'undercurl', 'guisp': s:current.yellow},
    \ 'DiagnosticUnnecessary': {'fg': s:current.primary_2, 'gui': 'undercurl', 'guisp': s:current.primary_3},
    \ 'QuickFixLine': {'fg': s:current.accent},
    \ 'Removed': {'fg': s:current.red},
    \ 'Added': {'fg': s:current.accent},
    \ 'DiffDelete': {'fg': s:current.red},
    \ 'DiffAdd': {'fg': s:current.accent},
    \ 'Changed': {'fg': s:current.primary_2},
    \ 'DiffChange': {'fg': s:current.primary_2},
    \ 'SnippetTabstop': {'fg': s:current.none},
    \ 'FzfLuaTitle': {'fg': s:current.fg},
    \ 'FzfLuaFzfPrompt': {'fg': s:current.fg},
    \ 'FzfLuaTabTitle': {'fg': s:current.blue},
    \ 'FzfLuaBorder': {'fg': s:current.primary},
    \ 'FzfLuaHeaderText': {'fg': s:current.red},
    \ 'FzfLuaBufFlagAlt': {'fg': s:current.blue},
    \ 'FzfLuaBufNr': {'fg': s:current.primary_4},
    \ 'FzfLuaTabMarker': {'fg': s:current.yellow},
    \ 'FzfLuaFzfInfo': {'fg': s:current.primary_2},
    \ 'FzfLuaPathLineNr': {'fg': s:current.accent},
    \ 'FzfLuaScrollFloatFull': {'fg': s:current.fg},
    \ 'FzfLuaScrollFloatEmpty': {'fg': s:current.fg},
    \ 'FzfLuaPathColNr': {'fg': s:current.primary_4},
    \ 'FzfLuaFzfPointer': {'fg': s:current.primary_3},
    \ 'FzfLuaLivePrompt': {'fg': s:current.primary_4},
    \ 'FzfLuaHeaderBind': {'fg': s:current.primary_5},
    \ 'FzfLuaSearch': {'fg': s:current.accent, 'bg': s:current.none},
    \ 'FzfLuaCursor': {'fg': s:current.accent, 'bg': s:current.none},
    \ 'FzfLuaFzfMatch': {'fg': s:current.accent, 'bg': s:current.none},
    \ 'FzfLuaCursorLine': {'fg': s:current.primary_3, 'bg': s:current.none},
    \ 'MasonHighlight': {'fg': s:current.accent},
    \ 'MasonHeaderSecondary': {'bg': s:current.primary},
    \ 'MasonMuted': {'fg': s:current.primary_2, 'bg': s:current.none},
    \ 'MasonHighlightBlock': {'fg': s:current.accent, 'bg': s:current.none},
    \ 'MasonHighlightBlockBold': {'fg': s:current.accent, 'bg': s:current.primary},
    \ 'MasonHeader': {'fg': s:current.primary_4, 'bg': s:current.bg, 'gui': 'bold'},
    \ 'MasonHeading': {'fg': s:current.primary_4, 'bg': s:current.bg, 'gui': 'bold'},
    \ 'MasonMutedBlock': {'fg': s:current.theme == 'light' ? s:current.bg : s:current.none, 'bg': s:current.bg},
    \ 'LazySpecial': {'fg': s:current.accent},
    \ 'LazyButton': {'bg': s:current.bg},
    \ 'LazyButtonActive': {'fg': s:current.accent, 'bg': s:current.primary},
    \ 'fugitiveHelpTag': {'fg': s:current.accent},
    \ 'fugitiveHeader': {'gui': 'bold'},
    \ 'fugitiveUntrackedHeading': {'fg': s:current.primary_3, 'gui': 'bold'},
    \ 'fugitiveUnstagedHeading': {'fg': s:current.primary_4, 'gui': 'bold'},
    \ 'fugitiveStagedHeading': {'fg': s:current.accent, 'gui': 'bold'},
    \ 'fugitiveCount': {'fg': s:current.primary_4},
    \ }

    for group_name in keys(s:groups)
        let props = s:groups[group_name]
        let cmd = 'hi ' . group_name

        if has_key(props, 'fg')
            let cmd .= ' guifg=' . props.fg
        endif
        if has_key(props, 'bg')
            let cmd .= ' guibg=' . props.bg
        endif
        if has_key(props, 'gui')
            let cmd .= ' gui=' . props.gui
        endif
        if has_key(props, 'guisp')
            let cmd .= ' guisp=' . props.guisp
        endif
        execute cmd
    endfor

    " Apply user custom highlight overrides
    for [group, props] in items(g:coocobolo_custom_highlights)
        let cmd = 'hi ' . group
        if has_key(props, 'fg')
            let cmd .= ' guifg=' . props.fg
        endif
        if has_key(props, 'bg')
            let cmd .= ' guibg=' . props.bg
        endif
        if has_key(props, 'bold') && props.bold
            let cmd .= ' gui=bold'
        endif
        execute cmd
    endfor
endfunction

" Apply selected palette
if exists('g:coocobolo_palette')
    let s:palette_name = g:coocobolo_palette
else
    if &background ==# 'dark'
        let s:palette_name = 'dark'
    else
        let s:palette_name = 'colorful'
    endif
endif

augroup coocobolo_autoload
    autocmd!
    " Apply the palette when Vim starts
    autocmd VimEnter * if exists('*CoocoboloSetPalette') | call CoocoboloSetPalette(s:palette_name) | endif
    " Also re-apply if the colorscheme is set later
    autocmd ColorScheme coocobolo if exists('*CoocoboloSetPalette') | call CoocoboloSetPalette(s:palette_name) | endif
augroup END
