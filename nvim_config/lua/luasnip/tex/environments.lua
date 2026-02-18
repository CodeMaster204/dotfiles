-- Basic environment delimiters and other sub environments (matrices, fracs)



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






return {
    s({trig="fig", snippetType="snippet", dscr="A basic figure environment"},
        fmta(
            [[
            \begin{figure}
            \centering
            \includegraphics[width=0.9\linewidth]{<>}
            \caption{
                \textbf{<>}
                <>
            }
            \label{fig:<>}
            \end{figure}

            ]],
            { i(1,"filename"),
            i(2, "captionBold"),
            i(3, "captionText"),
            i(4,"figureLabel"),}
        )
    ),
    s({trig="neww", snippetType="autosnippet", dscr="Begin and end an arbitrary environment"},
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            {i(1),i(2),rep(1),}
        ),
        {condition= line_begin}
    ),
    s({trig="qq", snippetType="autosnippet", dscr="Start an equation environment"},
        fmta(
            [[
            \begin{equation}
                <>
            \end{equation}
            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),
    s({trig="sqq", snippetType="autosnippet", dscr="Start an equation environment"},
        fmta(
            [[
            \begin{equation*}
                <>
            \end{equation*}
            ]],
            {i(1)}
        ),
        {condition = notmath and line_begin}
    ),
    s({trig="nn", snippetType="autosnippet", dscr="Start full math mode"},
        fmta(
            [[
            \[
                <>
            \]
            ]],
            {i(1)}
        ),
        {condition = notmath}
    ),
    s({trig="mm", snippetType="autosnippet", dscr="Start inline math mode"},
        fmta(
            [[
            \(
                <>
            \)
            ]],
            {i(1)}
        ),
        {condition = notmath}
    ),




    -- Font styles other than mathcal in letters.lua
    s({trig="tii", snippetType="autosnippet", dscr="Italic text"},
        fmta(
            [[\textit{<>}]],
            {i(1)}
        )
    ),

    s({trig="bff", snippetType="autosnippet", dscr="Bold face text"},
        fmta(
            [[\textbf{<>}]],
            {i(1)}
        )
    ),

    
    s({trig="rm", snippetType="autosnippet", dscr="Roman face text"},
        fmta(
            [[\textrm{<>}]],
            {i(1)}
        ),
        {condition = math}
    ),



}

