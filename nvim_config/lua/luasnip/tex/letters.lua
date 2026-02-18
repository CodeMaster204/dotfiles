-- letters.lua
-- Greek letters and mathcal snippets

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node



-- use vimtex to determine if we are in a math context
local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end


local function latex_letter(trig, expansion)
    return s(
        { trig = ";" .. trig, snippetType = "autosnippet", desc = expansion, wordTrig = false },
        { t("\\" .. expansion) },
        {condition = math}
    )
end

local function cal_letter(letter)
    return s(
        { trig = ";u" .. letter, snippetType = "autosnippet", desc = "mathcal: " .. letter, wordTrig = false },
        { t("\\mathcal{" .. string.upper(letter) .. "}") },
        {condition = math}
    )
end

return {

    -- Normal Greek letters
    latex_letter("a","alpha"),
    latex_letter("b","beta"),
    latex_letter("c","chi"),
    latex_letter("d","delta"),
    latex_letter("e","epsilon"),
    latex_letter("f","phi"),
    latex_letter("g","gamma"),
    latex_letter("h","eta"),
    latex_letter("i","iota"),
    latex_letter("k","kappa"),
    latex_letter("l","lambda"),
    latex_letter("m","mu"),
    latex_letter("n","nu"),
    latex_letter("o","omega"),
    latex_letter("p","pi"),
    latex_letter("q","psi"),
    latex_letter("r","rho"),
    latex_letter("s","sigma"),
    latex_letter("t","tau"),
    latex_letter("w","theta"),
    latex_letter("x","xi"),
    latex_letter("y","upsilon"),
    latex_letter("z","zeta"),

    -- Capital Greek letters
    latex_letter("jd","Delta"),
    latex_letter("jf","Phi"),
    latex_letter("jg","Gamma"),
    latex_letter("jl","Lambda"),
    latex_letter("jo","Omega"),
    latex_letter("jp","Pi"),
    latex_letter("jq","Psi"),
    latex_letter("js","Sigma"),
    latex_letter("jw","Theta"),
    latex_letter("jx","Xi"),
    latex_letter("jy","Upsilon"),

    -- Variant forms
    latex_letter("ve", "varepsilon"),
    latex_letter("vr", "varrho"),
    latex_letter("vk", "varkappa"),
    latex_letter("vs", "varsigma"),
    latex_letter("vp", "varpi"),
    latex_letter("vf", "varphi"),
    latex_letter("vw", "vartheta"),

    -- Calligraphic letters
    cal_letter("a"), cal_letter("b"), cal_letter("c"), cal_letter("d"),
    cal_letter("e"), cal_letter("f"), cal_letter("g"), cal_letter("h"),
    cal_letter("i"), cal_letter("j"), cal_letter("k"), cal_letter("l"),
    cal_letter("m"), cal_letter("n"), cal_letter("o"), cal_letter("p"),
    cal_letter("q"), cal_letter("r"), cal_letter("s"), cal_letter("t"),
    cal_letter("u"), cal_letter("v"), cal_letter("w"), cal_letter("x"),
    cal_letter("y"), cal_letter("z"),
}

