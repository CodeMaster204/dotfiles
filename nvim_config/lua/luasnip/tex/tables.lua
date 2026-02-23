-- Tables in latex. essentially the same as linalg.lua



local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
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

local function tableBody(_, snip)
    local rows = tonumber(snip.captures and snip.captures[1]) -- Number of rows
    local cols = tonumber(snip.captures and snip.captures[2]) -- Number of columns
    local nodes = {} -- Nodes table, essentially the dynamically generated fmta
    local index = 1 -- Index for the current insert node
    if not rows or not cols then
        return sn(nil, {t("")})
    end

    for r = 1, rows do
        for c = 1, cols do
            table.insert(nodes, i(index))
            index = index + 1
            if c < cols then
                table.insert(nodes, t(" & "))
            end
        end

        if r < rows then
            table.insert(nodes, 
            t({"\\\\", ""}))
        end
    end
    
    return sn(nil, nodes)
end

return{
    s(
        {trig = "(%d+)x(%d+)tab", regTrig=true, snippetType="autosnippet"},
        {
            -- Begin part of the snippet
            t("\\begin{tabular}{"),
            i(1),
            t({"}", ""}),

            -- Body of the table

            d(2, tableBody),

            -- End part of the snippet
            t({"","\\end{tabular}"}),
        }
    ),
}
