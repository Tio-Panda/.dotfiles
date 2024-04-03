-- TODO: Plugin para manejar mi colorscheme, tratar de convertirlo en plugin.
return {
    dir = '/home/panda/nvim_plugins/chameleon.nvim/',
    config = function()
        vim.cmd([[colorscheme chameleon]])
    end
}
