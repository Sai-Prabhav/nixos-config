local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	-- Function snippet with word trigger
	s({
		trig = "f",
		wordTrig = true,
		snippetType = "autosnippet"
	}, {
		t("function "),
	}),
	s({ trig = "fn", wordTrig = true, trigEngine = "plain", snippetType = "autosnippet" }, {
		t("function "),
		t("()"),
		t({ "", "\t" }),
		t({ "", "end" }),
	})
	,
	-- Hello world snippet with word trigger
	s({
		trig = "hi",
		wordTrig = true
	}, {
		t("Hello, world!")
	}),

	-- Another snippet with word trigger
	s({
		trig = "foo",
		wordTrig = true
	}, {
		t("Another snippet.")
	}),
}
