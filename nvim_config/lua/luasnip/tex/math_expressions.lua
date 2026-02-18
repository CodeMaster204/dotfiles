-- General math expressions like frac, int, exp, sum, prod etc.



local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function notmath()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 0
end


return{
    -- Math mode environments
    s({trig="ff", snippetType="autosnippet", dscr="Expand into \\frac{}{}"},
        fmta(
            [[\frac{<>}{<>}]],
            {i(1), i(2)}
        ),
        {condition = math}
    ),
    s({trig="ee", snippetType="autosnippet", dscr="Expand into \\e^{}"},
        fmta(
            [[e^{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),

}
