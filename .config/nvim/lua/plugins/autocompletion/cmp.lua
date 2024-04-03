return {
    'hrsh7th/nvim-cmp',
    dependencies = {

        -- TODO: Arreglar el cmp-spell para que muestre palabras en español
        -- TODO: Ver si hay otras sources que pueda agregar
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
        { 'saadparwaiz1/cmp_luasnip' },


        -- TODO: Dejar esto en la carpeta de colorscheme
        -- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
        --{ 'zbirenbaum/copilot-cmp' },

        -- Lspkind
        { 'onsails/lspkind.nvim' },

    },
    config = function()
        -- Setting sources for code and comments cancellation
        local context = require('cmp.config.context')
        local set_sources = function()
            local sources = {}
            if context.in_syntax_group('Comment') or context.in_treesitter_capture('comment') then
                sources = { { name = 'spell' }, }
            else
                sources = {
                    { name = 'path',     keyword_length = 1 },
                    { name = 'nvim_lsp', keyword_length = 2 },
                    { name = 'nvim_lua', keyword_length = 2 },
                    { name = 'luasnip',  keyword_length = 2 },
                    { name = 'buffer',   keyword_length = 5 },
                    { name = 'spell' }
                }
            end

            return sources
        end

        -- Config cmp
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            completion = {
                completeopt = 'menu, menuone, noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-u>'] = cmp.mapping.scroll_docs(4),
                ['<C-j>'] = cmp.mapping.select_prev_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<C-y>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }),
                ['<C-Space>'] = cmp.mapping.complete(),

            }),
            sources = set_sources(),
            sorting = {
                priority_weight = 2,
                comparators = {
                    -- require("copilot_cmp.comparators").prioritize,
                    -- require("copilot_cmp.comparators").score,

                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            formatting = {
                format = require('lspkind').cmp_format({
                    maxwidth = 70,
                    ellipsis_char = '...',
                    menu = {
                        buffer = "[buf]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[api]",
                        path = "[path]",
                        luasnip = "[snip]",
                        git = "[git]",
                        cmdline = "[cmd]",
                        latex_symbols = "[latex]",
                        spell = "[spell]",
                        -- copilot = "[copilot]"
                        -- gh_issues = "[issues]",
                    },
                    mode = "symbol_text",
                    preset = "codicons",
                    symbol_map = {
                        Copilot = "",
                    },
                })
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'path' },
                { name = 'cmdline' }
            }
        })

        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = {
                { name = 'git' },
                { name = 'buffer' },
            }
        })

        --TODO: ver si el latex_symbols funciona bien
        cmp.setup.filetype({ "tex", "plaintex", "text", "markdown" }, {
            sources = {
                { name = "latex_symbols", option = { strategy = 2 } },
                {
                    name =
                    'spell',
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                    },
                },
            }
        })
    end,
}
