return {
    {
        'akinsho/toggleterm.nvim', 
        version = '*',
        config = function()
            local opts = require('plugins.terminal.toggleterm')
            require('toggleterm').setup(opts)
        end
    },

    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            local opts = require('plugins.terminal.nvim-tmux-navigation')
            require('nvim-tmux-navigation').setup(opts)
        end
    },
}