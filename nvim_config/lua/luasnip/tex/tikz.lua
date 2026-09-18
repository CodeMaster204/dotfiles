-- General math expressions like frac, exp, sum, prod etc.



local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function notmath()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 0
end

local function compose_with_and(f1,f2)
    return function(...)
        return f1() and f2(...)
    end
end


local snippets = {
    s({trig="tnode", snippetType="autosnippet", dscr="Makes a text node at someplace"},
        fmta(
[[\node[<>] at (<>, <>) {<>};

]],
            {i(1, "right"), i(2), i(3), i(4)}
        ),
        {condition = line_begin}
    ),
}


local other_abbrevs= {
    draw = "\\draw ",
    fdraw = "\\filldraw ",
    path = "\\path ",
    node = "\\node ",
}
for trig, expansion in pairs(other_abbrevs) do

    table.insert(snippets,
        s({trig=trig, snippetType="autosnippet"},
            {t(expansion)},
            {condition=line_begin}
        )
    )
end

return snippets
