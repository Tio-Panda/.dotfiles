local status, cmp = pcall(require, 'cmp')
if not status then return end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local M = {}

M.opts = {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
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
        --{ name = 'copilot',                 keyword_length = 0 },
        { name = 'path',                    keyword_length = 1 },
        { name = 'nvim_lsp',                keyword_length = 2 },
        { name = 'nvim_lua',                keyword_length = 2 },
        { name = 'luasnip',                 keyword_length = 2 },
        { name = 'nvim_lsp_signature_help', keyword_length = 2 },
        { name = 'buffer',                  keyword_length = 5 },
    },
    formatting = {
        format = require('lspkind').cmp_format(require('plugins.snippets.lspkind')),
    },
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
}

-- TODO: Disminuir la lista de posibilidades que otorga y dejar todos los setups con la misma config para los keybind

M.search = {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
}

M.cmd = {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' }
    }
}

M.gitcommit = {
    sources = {
        { name = 'git' },
        { name = 'buffer' },
    }
}

M.writting = {
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
}

return M