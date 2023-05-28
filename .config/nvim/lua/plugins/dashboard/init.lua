return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local opts = require("plugins.dashboard.alpha")
            require("alpha").setup(opts)
        end,
    }
}
