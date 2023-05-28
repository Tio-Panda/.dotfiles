return {
    
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local opts = require('plugins.misc.todo-comments')
            require('todo-comments').setup(opts)
        end
    },
    
    { 'lewis6991/impatient.nvim' }
}