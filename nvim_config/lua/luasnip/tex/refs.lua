-- References, quotes, and bibliography stuff



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
    return not math()
end

local function compose_with_and(f1,f2)
    return function(...)
        return f1(...) and f2(...)
    end
end




return {
    --                   Bibliography environment
    s({trig="bibb", snippetType="autosnippet", dscr="Start a bibliography environment"},
        fmta(
            [[
            \begin{thebibliography}{<>}
                <>
            \end{thebibliography}

            ]],
            {i(1, "9"), i(2)}
        ),
        {condition = compose_with_and(notmath, line_begin)}
    ),

    --                  Bibliography items and citation shortcuts
    s({trig="bibitem", snippetType="autosnippet", dscr="Expands to \\bibitem with insert node"},
        fmta(
            [[\bibitem{<>}]],
            {i(1)}
        ),
        {condition = compose_with_and(notmath, line_begin)}
    ),

    s({trig="cci", snippetType="autosnippet", dscr="Expands into a citation"},
        fmta(
            [[\cite{<>}]],
            {i(1)}
        ),
        {condition =notmath}
    ),
    
    --                  Labels and refs
    s({trig="llb", snippetType="autosnippet", dscr="Expands into a label"},
        fmta(
            [[\label{<>:<>}]],
            {i(1,"eq"), i(2)}
        ),
        {condition =notmath}
    ),

    s({trig="rre", snippetType="autosnippet", dscr="Expands into a reference"},
        fmta(
            [[\ref{<>:<>}]],
            {i(1,"eq"), i(2)}
        ),
        {condition =notmath}
    ),

    --                  Quotations:
    s({trig="enquote", snippetType="autosnippet", dscr="Expands into an \\enquote"},
        fmta(
            [[\enquote{<>}]],
            {i(1)}
        ),
        {condition =notmath}
    ),
}

