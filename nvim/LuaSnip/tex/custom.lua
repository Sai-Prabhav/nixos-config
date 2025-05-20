local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

-- Uses vimtex to check if the cursor is inside a LaTeX math environment
local function in_mathzone()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Return a table of snippets
return {
	s({
		trig = "(?<!\\\\)(^|[^0-9a-zA-Z])([0-9a-zA-Z]*[a-zA-Z])(\\d+)([^0-9a-zA-Z]|$)", -- Regex trigger
		trigEngine = "pattern", -- Use pattern-based trigger engine
		regTrig = true, -- Enable regex
		wordTrig = false, -- Disable wordTrig since we're using regex
		snippetType = "autosnippet",
		priority = 1, -- Set priority
		dscr = "Auto letter subscript",
		condition = in_mathzone, -- Only trigger in math zones
	}, {
		f(function(_, snip)
			local prefix = snip.captures[1] -- First capture group (prefix)
			local letter = snip.captures[2] -- Second capture group (letters)
			local subscript = snip.captures[3] -- Third capture group (digits)
			local suffix = snip.captures[4] -- Fourth capture group (suffix)
			return prefix .. letter .. "_{" .. subscript .. "}" .. suffix
		end),
	}),
	
}
