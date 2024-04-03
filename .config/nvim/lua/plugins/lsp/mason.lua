-- Mason config
return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup({
            pip = {
                upgrade_pip = true,
            },
            ui = {
                border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        })
    end,
}

