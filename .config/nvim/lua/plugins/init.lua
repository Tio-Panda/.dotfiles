return {
    --TODO: Estos plugins estaban en edit, hay que ver para que son y si hay alguna cosa para reemplazarlos, sobretodo el de vim-textobj
    -- { 'tpope/vim-surround' },
    -- { 'wellle/targets.vim' },

    { 'chaoren/vim-wordmotion' },

    -- {
    --     'kana/vim-textobj-user',
    --     dependencies = {
    --         { 'glts/vim-textobj-comment' },
    --         { 'kana/vim-textobj-datetime' },
    --         { 'jceb/vim-textobj-uri' },
    --         { 'kana/vim-textobj-indent' },
    --     },
    --     -- config = function()
    --     --     vim.cmd([[
    --     --     call textobj#user#plugin('datetime', {
    --     --     \   'date': {
    --     --     \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
    --     --     \     'select': ['ad', 'id'],
    --     --     \   },
    --     --     \   'time': {
    --     --     \     'pattern': '\<\d\d:\d\d:\d\d\>',
    --     --     \     'select': ['at', 'it'],
    --     --     \   },
    --     --     \ })
    --     --     ]])
    --     -- end
    -- },

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
