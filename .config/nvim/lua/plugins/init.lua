return {
    --TODO: Se supone que en nvim 0.9 ya no se necesita, hay que arreglarlo.
    { 'lewis6991/impatient.nvim' },

    --TODO: Ver si de verdad es necesario y si hay una manera mas nvim-like
    {
        'mg979/vim-visual-multi',
        branch = 'master',
    },


    --TODO: Estos plugins estaban en edit, hay que ver para que son y si hay alguna cosa para reemplazarlos, sobretodo el de vim-textobj
    { 'tpope/vim-surround' },
    { 'wellle/targets.vim' },

    { 'chaoren/vim-wordmotion' },

    {
        'kana/vim-textobj-user',
        dependencies = {
            { 'glts/vim-textobj-comment' },
            { 'kana/vim-textobj-datetime' },
            { 'jceb/vim-textobj-uri' },
            { 'kana/vim-textobj-indent' },
        },
        -- config = function()
        --     vim.cmd([[
        --     call textobj#user#plugin('datetime', {
        --     \   'date': {
        --     \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
        --     \     'select': ['ad', 'id'],
        --     \   },
        --     \   'time': {
        --     \     'pattern': '\<\d\d:\d\d:\d\d\>',
        --     \     'select': ['at', 'it'],
        --     \   },
        --     \ })
        --     ]])
        -- end
    },

    -- {
    --     "LunarVim/breadcrumbs.nvim",
    --     dependencies = {
    --         {"SmiteshP/nvim-navic"},
    --     },
    --     config = function()
    --         require("breadcrumbs").setup()
    --     end
    -- },
    -- {
    --     'tiagovla/scope.nvim',
    --     config = function()
    --         require("scope").setup()
    --     end,
    -- },


    -- {
    --     'RRethy/nvim-base16',
    --     -- config = function()
    --     --     require('base16-colorscheme').setup()
    --     -- end
    -- },
}
