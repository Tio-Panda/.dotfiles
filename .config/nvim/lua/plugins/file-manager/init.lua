-- File & Buffer Manager

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
        },
        config = function()
            local telescope = require('telescope')
            local opts = require("plugins.file-manager.telescope")

            telescope.setup(opts)
            telescope.load_extension('fzf')
            telescope.load_extension("git_worktree")
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local opts = require("plugins.file-manager.nvim-tree")
            require("nvim-tree").setup(opts)
        end,
    },

    {
        'theprimeagen/harpoon',
        config = function() require("plugins.file-manager.harpoon") end,
    },

}

