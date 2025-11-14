return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            "Kaiser-Yang/blink-cmp-dictionary",
            dependencies = { "nvim-lua/plenary.nvim" },
            -- 'Kaiser-Yang/blink-cmp-git',
        },
    },
    opts = {
        -- TODO: Ver esto ya que los snippets personalizados se cargan 2 veces
        snippets = { preset = "luasnip" },
        completion = {
            documentation = {
                auto_show = true,
                treesitter_highlighting = true,
                window = { border = "rounded" },
            },
            accept = {
                auto_brackets = { enabled = false },
            },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        -- { "kind_icon", "kind", gap = 1 },
                        { "kind_icon", "source_name",       gap = 1 },
                    },
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                show_documentation = true,
                treesitter_highlighting = true,
            },
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },
        sources = {
            -- default = { "lsp", "path", "buffer", "lazydev", "dictionary" },
            -- TODO: estar atento a esta discusión: https://github.com/Saghen/blink.cmp/discussions/564
            default = function(ctx)
                local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                local success, node = pcall(vim.treesitter.get_node, {
                    pos = { row - 1, math.max(0, col - 1) },
                    ignore_injections = false,
                })

                -- TODO: Ver la posiblilidad de agregar esto cuando se esta editando una etiqueta html, ya sea en un html o jsx.
                -- TODO: Agregarlo en los strings

                if vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype) then
                    return { "lsp", "dictionary" }
                elseif
                    success
                    and node
                    and vim.tbl_contains({ "comment", "line_comment", "block_comment", "comment_content" }, node:type())
                then
                    return { "dictionary", "buffer" }
                else
                    -- return { "lsp", "path", "buffer", "lazydev", "git" }
                    return { "lsp", "path", "buffer", "snippets", "lazydev", }
                end
            end,
            providers = {
                lsp = {
                    min_keyword_length = 0,
                    score_offset = 0,
                },
                path = {
                    min_keyword_length = 0,
                },
                buffer = {
                    max_items = 5,
                    min_keyword_length = 5,
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    min_keyword_length = 0,
                    score_offset = 100,
                },
                -- git = {
                --     enabled = false,
                --     module = "blink-cmp-git",
                --     name = "Git",
                --     score_offset = 150,
                --     should_show_items = function()
                --         return vim.o.filetype == "gitcommit" or vim.o.filetype == "markdown"
                --     end,
                -- },
                dictionary = {
                    enabled = true,
                    module = "blink-cmp-dictionary",
                    name = "Dict",
                    score_offset = 20,
                    max_items = 5,
                    min_keyword_length = 4,
                    opts = {
                        dictionary_directory = {
                            vim.fn.expand("~/.config/nvim/dictionary"),
                        },
                        dictionary_files = {
                            vim.fn.expand("~/.config/nvim/dictionary/esp.txt"),
                            vim.fn.expand("~/.config/nvim/dictionary/eng.txt"),
                        },
                        separate_output = function(output)
                            local items = {}
                            for line in output:gmatch("[^\r\n]+") do
                                table.insert(items, {
                                    label = line,
                                    insert_text = line,
                                    documentation = nil,
                                })
                            end
                            return items
                        end,
                    },
                },
            },
        },
        keymap = {
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide" },
            ["<C-y>"] = { "select_and_accept" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },

            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<M-k>"] = { "scroll_documentation_up", "fallback" },
            ["<M-j>"] = { "scroll_documentation_down", "fallback" },

            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },

            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },
    },
}
