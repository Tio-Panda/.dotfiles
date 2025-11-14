--TODO: Se puede dejar esto completamente en el archivo de blink y usar la config de los snipets
-- return {}
return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local p = "plugins.autocompletion.snippets."
        require(p .. "makefile")
        require(p .. "cpp")

        -- require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
