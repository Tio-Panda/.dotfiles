return {
    {
        'tpope/vim-fugitive',
        config = function()
            require("plugins.git.fugitive")
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            local opts = require("plugins.git.gitsigns")
            require('gitsigns').setup(opts)
        end,
    },
    {
        'ThePrimeagen/git-worktree.nvim',
        config = function()
            local opts = require("plugins.git.git-worktree")
            require("git-worktree").setup(opts)
        end,
    }
}
