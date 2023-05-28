-- Edit Code
return {

    { 
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
        config = function()
            local opts = require("plugins.edit.treesitter")
            require("nvim-treesitter.configs").setup(opts)
        end
    },

    {
        'nvim-treesitter/playground',
        --lazy = "Alguna wea para que no se cargue hasta que se use"
    },

    {
        'mbbill/undotree',
        config = function()
            require("plugins.edit.undotree")
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            local opts = require("plugins.edit.comment")
            require("Comment").setup(opts)
        end
    },

    { 'chaoren/vim-wordmotion' },

    { 'wellle/targets.vim' },

    {   
        'kana/vim-textobj-user',
        dependencies = {
            { 'glts/vim-textobj-comment' },
            { 'kana/vim-textobj-datetime' },
            { 'jceb/vim-textobj-uri' },
            { 'kana/vim-textobj-indent' },
        },
        --[[ config = function()
            require("plugins.edit.vim-texobj-user")
        end ]]
    },

    -- hop.nvim

}