-- Mason config
return {
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
}
