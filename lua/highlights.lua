return function()
	local get_hlgroup = require("utils").get_hlgroup
	local nontext = get_hlgroup("NonText")
	local normal = get_hlgroup("Normal")
	local fg, bg = normal.fg, normal.bg
	-- local bg_alt = get_hlgroup("Visual").bg
	local green = get_hlgroup("String").fg
	local red = get_hlgroup("Error").fg
	-- local float_bg = get_hlgroup("NormalFloat").bg
	local float_bg = "#171717"
	local bg_alt = "#404040"
	-- vim.api.nvim_out_write(vim.inspect(get_hlgroup("NormalFloat").fg) .. "\n")

	-- return a table of highlights for telescope based on colors gotten from highlight groups
	return {
		CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
		GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
		HighlightURL = { underline = true }, -- always underline URLs

		-- Telescope
		TelescopeBorder = { fg = bg_alt, bg = float_bg },
		TelescopeNormal = { bg = float_bg },
		TelescopePreviewBorder = { fg = float_bg, bg = float_bg },
		TelescopePreviewNormal = { bg = float_bg },
		TelescopePreviewTitle = { fg = bg, bg = green },
		TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
		TelescopePromptNormal = { fg = fg, bg = bg_alt },
		TelescopePromptPrefix = { fg = red, bg = bg_alt },
		TelescopePromptTitle = { fg = float_bg, bg = red },
		TelescopeResultsBorder = { fg = float_bg, bg = float_bg },
		TelescopeResultsNormal = { bg = float_bg },
		TelescopeResultsTitle = { fg = float_bg, bg = float_bg },
	}
end
