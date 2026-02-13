-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'rebelot/kanagawa.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     config = function()
--       ---@diagnostic disable-next-line: missing-fields
--       require('kanagawa').setup {
--         styles = {
--           comments = { italic = false }, -- Disable italics in comments
--         },
--       }
--
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'kanagawa-wave'
--     end,
-- asidufhaisoudhfioasdhfiaushdfiuahsdfiuashf--   },
-- }
-- vim: ts=2 sts=2 sw=2 et
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

  end,
}

