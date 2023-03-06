local status, cmp = pcall(require, 'cmp')
if not status then return end

local status1, lspkind = pcall(require, 'lspkind')
if not status1 then return end

--====================
-- lspkind
--====================
lspkind.init {
    symbol_map = {
        Copilot = "",
    },
}

-- TODO: Dejar esto en la carpeta de colorscheme
-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

--====================
-- cmp
--====================
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
    }),
    sources = {
        { name = 'copilot',                 keyword_length = 0 },
        { name = 'path',                    keyword_length = 1 },
        { name = 'nvim_lsp',                keyword_length = 2 },
        { name = 'nvim_lua',                keyword_length = 2 },
        { name = 'luasnip',                 keyword_length = 2 },
        { name = 'nvim_lsp_signature_help', keyword_length = 2 },
        { name = 'buffer',                  keyword_length = 5 },
    },
    formatting = {
        -- Youtube: How to set up nice formatting for your sources.
        format = lspkind.cmp_format {
            with_text = true,
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
        },
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            require("copilot_cmp.comparators").prioritize,
            require("copilot_cmp.comparators").score,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
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
})

-- TODO: Disminuir la lista de posibilidades que otorga y dejar todos los setups con la misma config para los keybind

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
        { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
        { name = 'buffer' },
    }
})

--TODO: ver si el latex_symbols funciona bien
cmp.setup.filetype({ "tex", "plaintex", "text", "markdown" }, {
    sources = {
        { name = "latex_symbols", option = { strategy = 2 } },
        { name =
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
