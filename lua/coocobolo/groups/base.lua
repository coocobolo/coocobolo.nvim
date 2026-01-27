local M = {}

local function hex_to_dec(hex)
	hex = hex:gsub("#", "")
	return tonumber(hex, 16)
end

local function base(p)
	return {
		Normal = { bg = p.bg, fg = p.fg },

		Visual = { fg = p.none, bold = true, bg = p.primary },

		YankHighlight = { fg = p.primary_5, bold = true },

		lCursor = { fg = p.none, bg = p.none },

		TermCursor = { fg = p.none, bg = p.accent },

		Cursor = { fg = p.red, bg = p.accent },

		CursorColumn = { fg = p.none, bg = p.primary },

		CursorIM = { fg = p.none },

		CursorLine = { fg = p.none, bg = p.primary },

		CursorLineSign = { fg = p.bg },

		SignColumn = { fg = p.fg, bg = p.bg },

		CursorLineNr = { fg = p.accent },

		CursorLineFold = { fg = p.accent },

		EndOfBuffer = { fg = p.bg, bg = p.bg },

		Title = { fg = p.primary_4, bold = true },

		Bold = { bold = true, fg = p.primary_4 },

		LineNr = { fg = p.primary_2, bg = p.bg },

		FloatBorder = { bold = true, fg = p.primary },

		FloatTitle = { fg = p.primary_2 },

		StatusLine = { bg = p.bg, fg = p.fg },

		TabLine = { bg = p.bg, fg = p.fg },

		TabLineSel = { bg = p.bg, fg = p.primary_3 },

		TabLineFill = { bg = p.bg, fg = p.primary_3 },

		StatusLineNC = { bg = p.bg, fg = p.fg },

		StatusLineTerm = { bg = p.bg, fg = p.fg },

		VertSplit = { bg = p.bg, fg = p.bg },

		Directory = { fg = p.primary_3 },

		WinSeparator = { bg = p.bg, fg = p.bg },

		Error = { fg = p.red },

		ErrorMsg = { fg = p.red },

		WarningMsg = { fg = p.yellow },

		Todo = { fg = p.primary_6 },

		Directory = { fg = p.primary_3 },

		CurSearch = { fg = p.accent, bg = p.none, bold = true },

		Search = { fg = p.accent, bg = p.none },

		IncSearch = { fg = p.accent, bold = true },

		Folded = { fg = p.primary_2, bold = true },

		FoldColumn = { fg = p.primary_2 },

		ModeMsg = { fg = p.accent },

		MoreMsg = { fg = p.accent },

		Question = { fg = p.primary_2 },

		NormalFloat = { bg = p.bg },

		Pmenu = { bg = p.none },

		PmenuThumb = { bg = p.none },

		PmenuSel = { bg = p.accent, fg = p.bg },
	}
end

local function codes(p)
	return {
		Type = { fg = p.primary_4 },
		String = { fg = p.primary_3 },
		Comment = { fg = p.primary_2 },
		Special = { fg = p.primary_3 },
		Constant = { fg = p.primary_3 },
		Statement = { fg = p.primary_4 },
		["@variable"] = { fg = p.primary_3 },
		["@markup.list.markdown"] = { bold = true },
		Conceal = { fg = p.primary_3, bold = true },
		Function = { fg = p.primary_5, bold = true },
		Operator = { fg = p.primary_2, bold = true },
		Delimiter = { fg = p.primary_2, bold = true },
		Underlined = { fg = p.primary_3, underline = true },
		Identifier = { fg = p.accent, bold = p.theme == "light" },
	}
end

local function diagnostics(p)
	return {
		DiagnosticSignError = { fg = p.red },
		DiagnosticHint = { fg = p.primary_4 },
		DiagnosticSignWarn = { fg = p.yellow },
		DiagnosticError = { fg = p.red, bg = p.none },
		DiagnosticWarn = { fg = p.yellow, bg = p.none },
		DiagnosticInfo = { fg = p.primary_6, bg = p.none },
		DiagnosticVirtualTextError = { fg = p.red, bg = p.none },
		DiagnosticVirtualLinesError = { fg = p.red, bg = p.none },
		DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.none },
		DiagnosticVirtualLinesWarn = { fg = p.yellow, bg = p.none },
		DiagnosticUnderlineError = { undercurl = true, sp = hex_to_dec(p.red) },
		DiagnosticUnderlineWarn = { undercurl = true, sp = hex_to_dec(p.yellow) },
		DiagnosticUnnecessary = { fg = p.primary_2, undercurl = true, sp = p.primary_3 },
		QuickFixLine = { fg = p.accent },
	}
end

local function codes_go(p)
	return {
		["@module.go"] = { fg = p.primary_6 },
		["@keyword.repeat.go"] = { fg = p.blue },
		["@function.call.go"] = { bold = false },
		["@keyword.function.go"] = { fg = p.red },
		["@keyword.type.go"] = { fg = p.primary_3 },
		["@function.builtin.go"] = { fg = p.yellow },
		["@type.builtin.go"] = { fg = p.primary_5 },
		["@boolean.go"] = { fg = p.yellow, bold = true },
		["@variable.parameter.go"] = { fg = p.primary_4 },
		["@keyword.conditional.go"] = { fg = p.primary_5 },
		["@keyword.coroutine.go"] = { fg = p.blue, bold = true },
		["@keyword.return.go"] = { fg = p.primary_6, bold = true },
		["@type.definition.go"] = { fg = p.primary_5, bold = true },
		["@keyword.import.go"] = { fg = p.theme == "dark" and p.primary_3 or p.accent },
	}
end

local function codes_lua(p)
	return {
		["@keyword.lua"] = { fg = p.accent },
		["@property.lua"] = { fg = p.primary_4 },
		["@lsp.type.property.lua"] = { fg = p.primary_4 },
		["@keyword.return.lua"] = { fg = p.primary_4, bold = true },
	}
end

local function diff(p)
	return {
		Removed = { fg = p.red },
		Added = { fg = p.accent },
		DiffDelete = { fg = p.red },
		DiffAdd = { fg = p.accent },
		Changed = { fg = p.primary_2 },
		DiffChange = { fg = p.primary_2 },
	}
end

local function snippets(p)
	return {
		SnippetTabstop = { fg = p.none },
	}
end

local function fzf_lua(p)
	return {
		FzfLuaTitle = { fg = p.fg },
		FzfLuaFzfPrompt = { fg = p.fg },
		FzfLuaTabTitle = { fg = p.blue },
		FzfLuaBorder = { fg = p.primary },
		FzfLuaHeaderText = { fg = p.red },
		FzfLuaBufFlagAlt = { fg = p.blue },
		FzfLuaBufNr = { fg = p.primary_4 },
		FzfLuaTabMarker = { fg = p.yellow },
		FzfLuaFzfInfo = { link = "Comment" },
		FzfLuaPathLineNr = { fg = p.accent },
		FzfLuaScrollFloatFull = { fg = p.fg },
		FzfLuaScrollFloatEmpty = { fg = p.fg },
		FzfLuaPathColNr = { fg = p.primary_4 },
		FzfLuaFzfPointer = { fg = p.primary_3 },
		FzfLuaLivePrompt = { fg = p.primary_4 },
		FzfLuaHeaderBind = { fg = p.primary_5 },
		FzfLuaSearch = { bg = p.none, fg = p.accent },
		FzfLuaCursor = { bg = p.none, fg = p.accent },
		FzfLuaFzfMatch = { bg = p.none, fg = p.accent },
		FzfLuaCursorLine = { bg = p.none, fg = p.primary_3 },
	}
end

local function ziglang(p)
	return {
		["@keyword.import.zig"] = { fg = p.accent },
		["@keyword.function.zig"] = { fg = p.accent },
		["@lsp.type.namespace.zig"] = { fg = p.primary_4 },
		["@keyword.exception.zig"] = { fg = p.yellow },
		["@lsp.type.keywordLiteral.zig"] = { fg = p.primary_5 },
		["@keyword.repeat.zig"] = { fg = p.blue },
		["@lsp.type.variable.zig"] = { fg = p.primary_4 },
		["@lsp.type.type.zig"] = { fg = p.primary_4 },
		["@keyword.conditional.zig"] = { fg = p.primary_5 },
		["@lsp.type.builtin.zig"] = { fg = p.primary_5 },
		["@lsp.type.errorTag.zig"] = { fg = p.yellow },
		["@lsp.type.number.zig"] = { fg = p.yellow },
		["@lsp.type.method.zig"] = { fg = p.primary_5 },
	}
end

local function oil(p)
	return {
		OilFile = { fg = p.primary_3 },
	}
end

local function mason(p)
	return {
		MasonHighlight = { fg = p.accent },
		MasonHeaderSecondary = { bg = p.primary },
		MasonMuted = { fg = p.primary_2, bg = p.none },
		MasonHighlightBlock = { fg = p.accent, bg = p.none },
		MasonHighlightBlockBold = { fg = p.accent, bg = p.primary },
		MasonHeader = { fg = p.primary_4, bg = p.bg, bold = true },
		MasonHeading = { fg = p.primary_4, bg = p.bg, bold = true },
		MasonMutedBlock = { bg = p.bg, fg = p.theme == "light" and p.bg or p.none },
	}
end

local function lazy(p)
	return {
		LazySpecial = { fg = p.accent },
		LazyButton = { bg = p.bg },
		LazyButtonActive = { bg = p.primary, fg = p.accent },
	}
end

local function fugitive(p)
	return {
		fugitiveHelpTag = { fg = p.accent },
		fugitiveHeader = { bold = true },
		fugitiveUntrackedHeading = { bold = true, fg = p.primary_3 },
		fugitiveUnstagedHeading = { bold = true, fg = p.primary_4 },
		fugitiveStagedHeading = { bold = true, fg = p.accent },
		fugitiveCount = { fg = p.primary_4 },
	}
end

local function gitsigns(p)
	return {
		GitSignsDeleteInline = { fg = p.red },
		GitSignsAddInline = { fg = p.fg },
	}
end

function M.hl(p)
	local groups = vim.tbl_deep_extend(
		"force",
		--
		base(p),
		codes(p),
		diagnostics(p),
		codes_go(p),
		codes_lua(p),
		diff(p),
		snippets(p),
		fzf_lua(p),
		mason(p),
		oil(p),
		lazy(p),
		fugitive(p),
		gitsigns(p)
		--
	)

	-- Iterate over each group and apply default values if empty
	for _, properties in pairs(groups) do
		-- If the group is empty, apply the default { fg = p.fg, bg = p.bg }
		if next(properties) == nil then -- Check if the table is empty
			properties.fg = p.fg
			properties.bg = p.bg
		else
			-- If there's an override, respect it, and only change missing properties
			if properties.fg then
				properties.fg = properties.fg or p.fg
			end

			if properties.bg then
				properties.bg = properties.bg or p.bg
			end
		end
	end
	return groups
end

return M
