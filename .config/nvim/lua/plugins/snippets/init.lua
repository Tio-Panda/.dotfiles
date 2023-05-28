return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {

            -- TODO: Arreglar el cmp-spell para que muestre palabras en español
            -- Sources
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-cmdline' },
            { 'petertriho/cmp-git' },
            { 'f3fora/cmp-spell' },
            { 'kdheepak/cmp-latex-symbols' },
            --{ 'zbirenbaum/copilot-cmp' },

            -- Snippet engine
            { 'saadparwaiz1/cmp_luasnip' },
            {
                "L3MON4D3/LuaSnip",
                version = "1.*", 
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("plugins.snippets.luasnip").setup()
                end,
            },

            -- UI
            { 'onsails/lspkind.nvim' },
        },
        config = function()
            local cmp = require('cmp')
            local settings = require('plugins.snippets.cmp')
            
            cmp.setup(settings.opts)

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, settings.search)

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', settings.cmd)

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', settings.gitcommit)

            --TODO: ver si el latex_symbols funciona bien
            cmp.setup.filetype({ "tex", "plaintex", "text", "markdown" }, settings.writting)
        end,
    },
}