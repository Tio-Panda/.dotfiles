-- TODO: Plugin para manejar mi colorscheme, tratar de convertirlo en plugin.

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = false,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert = true,
            contrast = "hard",
            transparent_mode = true,
        })

        vim.cmd("colorscheme gruvbox")
    end,
}

-- return {
--     dir = '/home/panda/nvim_plugins/chameleon.nvim/',
--     config = function()
--         vim.cmd([[colorscheme chameleon]])
--     end
-- }
