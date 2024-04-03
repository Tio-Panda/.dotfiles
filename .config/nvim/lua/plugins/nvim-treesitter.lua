return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    dependencies =
        { 'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Add languages to be installed here that you want installed for treesitter
            -- ensure_installed = {
            --     'c',
            --     'cpp',
            --     'go',
            --     'lua',
            --     'python',
            --     'rust',
            --     'typescript',
            --     'javascript',
            --     'vim',
            --     'markdown'
            -- },
            auto_install = true,
            ignore_install = { 'help' },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown' },
            },
            indent = { enable = true, disable = { 'python' } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    node_incremental = '<CR>',
                    scope_incremental = 'false',
                    node_decremental = '<BS>',
                },
            },
        })
    end
}
