local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Ensure autosnippets are enabled globally
require("luasnip").config.set_config({
	enable_autosnippets = true,
})

-- Only expand in LaTeX math zones
local function in_mathzone()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Define a single test snippet
ls.add_snippets("tex", {
	s({
		trig = "int",
		wordTrig = true,
		auto = true,
		condition = in_mathzone,
		dscr = "Integral symbol",
	}, {
		t("\\int"),
	}),
})
