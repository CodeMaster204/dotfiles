return {
    "danymat/neogen",
    dependencies = {
        "L3MON4D3/LuaSnip",
    },
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
    end,
    -- Uncomment next line if you want to follow only stable versions
    version = "*",
}

