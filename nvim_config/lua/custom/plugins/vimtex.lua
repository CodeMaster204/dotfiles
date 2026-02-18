return {
  "lervag/vimtex",
  lazy = false, -- load immediately for LaTeX files
  init = function()
    -- Use zathura (change if needed)
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 1,
        styles = 1,
    }
    vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
    vim.g.vimtex_quickfix_ignore_filters = {"Underfull","Overfull", "LaTeX Warning: .\\+ float specifier changed to", "Package hyperref Warning: Token not allowed in a PDF string"}

  end,
}

