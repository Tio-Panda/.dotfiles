return {
    {
        "epwalsh/obsidian.nvim",
        config = function()
            local opts = require("plugins.writting.obsidian")
            require("obsidian").setup(opts)
        end
    },

    {
        "uga-rosa/translate.nvim",
        config = function()
            local opts = require("plugins.writting.translate")
            require("translate").setup(opts)
        end
    },
}