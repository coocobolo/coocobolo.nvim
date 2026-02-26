" Vim colorscheme
" Name: coocobolo
" Maintainer: @coocobolo (coocoobolo1@gmail.com)
" License: MIT

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

function! s:HexToDec(hex)
  return str2nr(a:hex[1:], 16)
endfunction


function! CoocoboloSetPalette(name)
    if a:name ==# 'dark'
        let g:coocobolo_current = g:coocobolo_dark
    elseif a:name ==# 'colorful'
        let g:coocobolo_current = g:coocobolo_colorful
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

   let s:groups = {
   \ 'Normal': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg}, 
   \ 'Visual': {'fg': g:coocobolo_current.none, 'bg': g:coocobolo_current.primary, 'gui': 'bold'},
   \ 'YankHighlight': {'fg': g:coocobolo_current.primary_5, 'gui': 'bold'},
   \ 'lCursor': {'fg': g:coocobolo_current.none, 'bg': g:coocobolo_current.none},
   \ 'TermCursor': {'fg': g:coocobolo_current.none, 'bg': g:coocobolo_current.accent},
   \ 'Cursor': {'fg': g:coocobolo_current.red, 'bg': g:coocobolo_current.accent},
   \ 'CursorColumn': {'fg': g:coocobolo_current.none, 'bg': g:coocobolo_current.primary},
   \ 'CursorIM': {'fg': g:coocobolo_current.none},
   \ 'CursorLine': {'fg': g:coocobolo_current.none, 'bg': g:coocobolo_current.primary},
   \ 'CursorLineSign': {'fg': g:coocobolo_current.bg},
   \ 'SignColumn': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg},
   \ 'CursorLineNr': {'fg': g:coocobolo_current.accent},
   \ 'CursorLineFold': {'fg': g:coocobolo_current.accent},
   \ 'EndOfBuffer': {'fg': g:coocobolo_current.bg, 'bg': g:coocobolo_current.bg},
   \ 'Title': {'fg': g:coocobolo_current.primary_4, 'gui': 'bold'},
   \ 'Bold': {'fg': g:coocobolo_current.primary_4, 'gui': 'bold'},
   \ 'LineNr': {'fg': g:coocobolo_current.primary_2, 'bg': g:coocobolo_current.bg},
   \ 'FloatBorder': {'fg': g:coocobolo_current.primary, 'gui': 'bold'},
   \ 'FloatTitle': {'fg': g:coocobolo_current.primary_2},
   \ 'StatusLine': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg},
   \ 'TabLine': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg},
   \ 'TabLineSel': {'fg': g:coocobolo_current.primary_3, 'bg': g:coocobolo_current.bg},
   \ 'TabLineFill': {'fg': g:coocobolo_current.primary_3, 'bg': g:coocobolo_current.bg},
   \ 'StatusLineNC': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg},
   \ 'StatusLineTerm': {'fg': g:coocobolo_current.fg, 'bg': g:coocobolo_current.bg},
   \ 'VertSplit': {'fg': g:coocobolo_current.bg, 'bg': g:coocobolo_current.bg},
   \ 'Directory': {'fg': g:coocobolo_current.primary_3},
   \ 'WinSeparator': {'fg': g:coocobolo_current.bg, 'bg': g:coocobolo_current.bg},
   \ 'Error': {'fg': g:coocobolo_current.red},
   \ 'ErrorMsg': {'fg': g:coocobolo_current.red},
   \ 'WarningMsg': {'fg': g:coocobolo_current.yellow},
   \ 'Todo': {'fg': g:coocobolo_current.primary_6},
   \ 'CurSearch': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none, 'gui': 'bold'},
   \ 'Search': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none},
   \ 'IncSearch': {'fg': g:coocobolo_current.accent, 'gui': 'bold'},
   \ 'Folded': {'fg': g:coocobolo_current.primary_2, 'gui': 'bold'},
   \ 'FoldColumn': {'fg': g:coocobolo_current.primary_2},
   \ 'ModeMsg': {'fg': g:coocobolo_current.accent},
   \ 'MoreMsg': {'fg': g:coocobolo_current.accent},
   \ 'Question': {'fg': g:coocobolo_current.primary_2},
   \ 'NormalFloat': {'bg': g:coocobolo_current.bg},
   \ 'Pmenu': {'bg': g:coocobolo_current.none},
   \ 'PmenuThumb': {'bg': g:coocobolo_current.none},
   \ 'PmenuSel': {'fg': g:coocobolo_current.bg, 'bg': g:coocobolo_current.accent},
   \ 'Type': {'fg': g:coocobolo_current.primary_4},
   \ 'String': {'fg': g:coocobolo_current.primary_3},
   \ 'Comment': {'fg': g:coocobolo_current.primary_2},
   \ 'Special': {'fg': g:coocobolo_current.primary_3},
   \ 'Constant': {'fg': g:coocobolo_current.primary_3},
   \ 'Statement': {'fg': g:coocobolo_current.primary_4},
   \ 'Function': {'fg': g:coocobolo_current.primary_5, 'gui': 'bold'},
   \ 'Operator': {'fg': g:coocobolo_current.primary_2, 'gui': 'bold'},
   \ 'Delimiter': {'fg': g:coocobolo_current.primary_2, 'gui': 'bold'},
   \ 'Underlined': {'fg': g:coocobolo_current.primary_3, 'gui': 'underline'},
   \ 'Identifier': {'fg': g:coocobolo_current.accent},
   \ 'DiagnosticSignError': {'fg': g:coocobolo_current.red},
   \ 'DiagnosticSignWarn': {'fg': g:coocobolo_current.yellow},
   \ 'DiagnosticHint': {'fg': g:coocobolo_current.primary_4},
   \ 'DiagnosticError': {'fg': g:coocobolo_current.red, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticWarn': {'fg': g:coocobolo_current.yellow, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticInfo': {'fg': g:coocobolo_current.primary_6, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticVirtualTextError': {'fg': g:coocobolo_current.red, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticVirtualLinesError': {'fg': g:coocobolo_current.red, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticVirtualTextWarn': {'fg': g:coocobolo_current.yellow, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticVirtualLinesWarn': {'fg': g:coocobolo_current.yellow, 'bg': g:coocobolo_current.none},
   \ 'DiagnosticUnderlineError': {'gui': 'undercurl', 'guisp': g:coocobolo_current.red},
   \ 'DiagnosticUnderlineWarn': {'gui': 'undercurl', 'guisp': g:coocobolo_current.yellow},
   \ 'DiagnosticUnnecessary': {'fg': g:coocobolo_current.primary_2, 'gui': 'undercurl', 'guisp': g:coocobolo_current.primary_3},
   \ 'QuickFixLine': {'fg': g:coocobolo_current.accent},
   \ 'Removed': {'fg': g:coocobolo_current.red},
   \ 'Added': {'fg': g:coocobolo_current.accent},
   \ 'DiffDelete': {'fg': g:coocobolo_current.red},
   \ 'DiffAdd': {'fg': g:coocobolo_current.accent},
   \ 'Changed': {'fg': g:coocobolo_current.primary_2},
   \ 'DiffChange': {'fg': g:coocobolo_current.primary_2},
   \ 'SnippetTabstop': {'fg': g:coocobolo_current.none},
   \ 'FzfLuaTitle': {'fg': g:coocobolo_current.fg},
   \ 'FzfLuaFzfPrompt': {'fg': g:coocobolo_current.fg},
   \ 'FzfLuaTabTitle': {'fg': g:coocobolo_current.blue},
   \ 'FzfLuaBorder': {'fg': g:coocobolo_current.primary},
   \ 'FzfLuaHeaderText': {'fg': g:coocobolo_current.red},
   \ 'FzfLuaBufFlagAlt': {'fg': g:coocobolo_current.blue},
   \ 'FzfLuaBufNr': {'fg': g:coocobolo_current.primary_4},
   \ 'FzfLuaTabMarker': {'fg': g:coocobolo_current.yellow},
   \ 'FzfLuaFzfInfo': {'fg': g:coocobolo_current.primary_2},
   \ 'FzfLuaPathLineNr': {'fg': g:coocobolo_current.accent},
   \ 'FzfLuaScrollFloatFull': {'fg': g:coocobolo_current.fg},
   \ 'FzfLuaScrollFloatEmpty': {'fg': g:coocobolo_current.fg},
   \ 'FzfLuaPathColNr': {'fg': g:coocobolo_current.primary_4},
   \ 'FzfLuaFzfPointer': {'fg': g:coocobolo_current.primary_3},
   \ 'FzfLuaLivePrompt': {'fg': g:coocobolo_current.primary_4},
   \ 'FzfLuaHeaderBind': {'fg': g:coocobolo_current.primary_5},
   \ 'FzfLuaSearch': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none},
   \ 'FzfLuaCursor': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none},
   \ 'FzfLuaFzfMatch': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none},
   \ 'FzfLuaCursorLine': {'fg': g:coocobolo_current.primary_3, 'bg': g:coocobolo_current.none},
   \ 'MasonHighlight': {'fg': g:coocobolo_current.accent},
   \ 'MasonHeaderSecondary': {'bg': g:coocobolo_current.primary},
   \ 'MasonMuted': {'fg': g:coocobolo_current.primary_2, 'bg': g:coocobolo_current.none},
   \ 'MasonHighlightBlock': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.none},
   \ 'MasonHighlightBlockBold': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.primary},
   \ 'MasonHeader': {'fg': g:coocobolo_current.primary_4, 'bg': g:coocobolo_current.bg, 'gui': 'bold'},
   \ 'MasonHeading': {'fg': g:coocobolo_current.primary_4, 'bg': g:coocobolo_current.bg, 'gui': 'bold'},
   \ 'MasonMutedBlock': {'fg': g:coocobolo_current.theme == 'light' ? g:coocobolo_current.bg : g:coocobolo_current.none, 'bg': g:coocobolo_current.bg},
   \ 'LazySpecial': {'fg': g:coocobolo_current.accent},
   \ 'LazyButton': {'bg': g:coocobolo_current.bg},
   \ 'LazyButtonActive': {'fg': g:coocobolo_current.accent, 'bg': g:coocobolo_current.primary},
   \ 'fugitiveHelpTag': {'fg': g:coocobolo_current.accent},
   \ 'fugitiveHeader': {'gui': 'bold'},
   \ 'fugitiveUntrackedHeading': {'fg': g:coocobolo_current.primary_3, 'gui': 'bold'},
   \ 'fugitiveUnstagedHeading': {'fg': g:coocobolo_current.primary_4, 'gui': 'bold'},
   \ 'fugitiveStagedHeading': {'fg': g:coocobolo_current.accent, 'gui': 'bold'},
   \ 'fugitiveCount': {'fg': g:coocobolo_current.primary_4},
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

endfunction

if exists('g:coocobolo_palette')
    let s:palette_name = g:coocobolo_palette
else
    if &background ==# 'dark'
        let s:palette_name = 'dark'
    else
        let s:palette_name = 'colorful'
    endif
endif

" Apply selected palette
call CoocoboloSetPalette(s:palette_name)
