local M = {}

M.base = {
	dark_erie = "#1B1B1B",
	dark_onxy = "#101010",
	dark_onxy2 = "#171717",
	dark_eerie = "#1A1A1A",
	dark_rangoon = "#191919",
	dark_jungle = "#202020",
	dark_jungle2 = "#212121",
	grey_corporate = "#5C5C5C",
	grey_simple = "#676765",
	grey_gravel = "#484848",
	grey_slate = "#BAB8B4",
	stone_cold = "#555555",
	kettleman = "#606060",
	green_meadow = "#71AC1E",
	green_meadow2 = "#95C92C",
	green_dull = "#D9D930",
	green_toska = "#5DE4C7",
	green_emerald = "#50C878",
	green_payton = "#81BE83",
	green_limerick = "#A5BE00",
	green_neon = "#9ACD32",
	green_coral = "#82CD47",
	darkolivegreen = "#5a5e48",
	red_orange = "#F26E5A",
	red_coral = "#FF4545",
	grape = "#B9C0EA",
	grape_elsie = "#D79FC7",
	grape_elsie2 = "#564050",
	blue_light_teal = "#B1CCC5",
	blue_heavy_teal = "#7f804f",
	blue_deepsky_30 = "#2084af",
	blue_lowkey = "#B5CBCC",
	blue_lowkey2 = "#BECDDB",
	yellow_coral = "#FAEA48",
	yellow_candle = "#FFC436",
	yellow_naples = "#FFD05E",
	yellow_naples_90 = "#FFE099",
	yellowgreen = "#95C92C",
	yellow_sunglow = "#FFC436",
	yellow_sunglow_dim = "#FFD05E",
	goldenrod = "#FFC436",
	orange_beer = "#FB8B24",
	orange_chinese = "#FFB000",
	orange_soft = "#F3B664",
	orange_chrome = "#FFA600",
	orange_blush = "#EEA190",
	shocking_orange = "#E0654A",

	none = "NONE",
	black = "#000000",
	pot_black = "#161616",
	crimson = "#E3635F",
	dark_slate_gray = "#444443",
	witch_brew = "#8A8635",
	amber = "#FFBF00",
	off_black = "#303030",
	dark_grey = "#353535",
	black_tie = "#474747",
	smokey_wings = "#B1ADAB",
	equilibrium = "#a5a09e",
	pedigrey = "#8E8C8A",
	green_shadow = "#7A7B4C",
	charcoal_smudge = "#605f5e",
	blue_deepsky = "#00BFFF",
	silver = "#BAB8B4",
	dugong = "#707070",
	dark_gray = "#AEABA7",
}

local merge = function(a, b)
	local c = {}
	for k, v in pairs(a) do
		c[k] = v
	end
	for k, v in pairs(b) do
		c[k] = v
	end
	return c
end

M.dark_palette = {
	bg = M.base.black,
	fg = M.base.dark_slate_gray,
	primary = M.base.pot_black,
	primary_2 = M.base.dark_grey,
	primary_3 = M.base.charcoal_smudge,
	primary_4 = M.base.pedigrey,
	primary_5 = M.base.equilibrium,
	primary_6 = M.base.smokey_wings,
	red = M.base.crimson,
	green = M.base.green_shadow,
	blue = M.base.blue_deepsky,
	yellow = M.base.yellow_candle,
	accent = M.base.green_shadow,
}

M.colorful_palette = {
	bg = M.base.silver,
	fg = M.base.black,
	primary = M.base.dark_gray,
	primary_6 = M.base.black_tie,
	primary_5 = M.base.stone_cold,
	primary_4 = M.base.kettleman,
	primary_3 = M.base.off_black,
	primary_2 = M.base.dugong,
	red = M.base.crimson,
	green = M.base.witch_brew,
	blue = M.base.blue_deepsky,
	yellow = M.base.amber,
	accent = M.base.witch_brew,
}

M.dark_palette = merge(M.base, M.dark_palette)
M.colorful_palette = merge(M.base, M.colorful_palette)

return M
