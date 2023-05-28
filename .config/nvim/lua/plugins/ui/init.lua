return {
    { 
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local opts = require('plugins.ui.lualine')
            require('lualine').setup(opts)
        end
    },

    {
        'akinsho/bufferline.nvim', 
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        --[[ config = function()
            
        end ]]
    },
}