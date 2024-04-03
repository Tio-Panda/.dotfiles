return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        -- Setting variables
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")

        -- Config mason_lspconfig
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "pyright", "clangd" },
        })

        -- Config mason handler and lsp servers
        mason_lspconfig.setup_handlers({
            function(server_name)

                -- Default config
                local opts = { capabilities = cmp_nvim_lsp.default_capabilities() }

                -- Get custom config for lsp servers
                local exists, config = pcall(require, "plugins.lsp.servers." .. server_name)
                if exists then
                    opts = vim.tbl_deep_extend("force", config, opts)
                end

                -- Config lsp server
                lspconfig[server_name].setup({ opts })
            end,
        })

        -- Config vim diagnostics 
    	vim.diagnostic.config({
    		virtual_text = true,
    		float = {
    			focusable = false,
    			style = "minimal",
    			border = "rounded",
    			source = "always",
    			header = "",
    			prefix = "",
    		},
    		signs = true,
    		underline = true,
    		update_in_insert = true,
    		severity_sort = false,
    	})

        -- on_attach function
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)


                -- Show diagnostics in a hover window
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = ev.buffer,
                    callback = function()
                        local opts = {
                            focusable = false,
                           close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = 'rounded',
                            source = 'always',
                            prefix = ' ',
                            scope = 'cursor',
                        }
                        vim.diagnostic.open_float(nil, opts)
                    end
                })

                -- Define Keybindings
                local map = function(mode, keys, func, desc)
                    desc = 'LSP: ' .. desc
                    vim.keymap.set(mode, keys, func, { noremap = true, silent = true, buffer = ev.buf, desc = desc })
                end

                local builtin = require("telescope.builtin")

                map('n', '[d', vim.diagnostic.goto_prev, 'Previous [d]iagnostic')
                map('n', ']d', vim.diagnostic.goto_next, 'Next [d]iagnostic')
                map('n', '<leader>e', vim.diagnostic.open_float, 'Open diagnostic in float window')
                map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic in loclist')


                map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
                map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

                map('n', '<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
                map('n', '<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
                map('n', '<C-f>', function()
                    vim.lsp.buf.format({ async = true })
                end, '[f]ormat code')

                map('n', 'gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
                map('n', 'gr', builtin.lsp_references, '[g]oto [r]eferences')
                map('n', 'gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
                map('n', 'gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')

                map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                map('n', '<leader>ds', builtin.lsp_document_symbols, '[d]ocument [s]ymbols')
                map('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')

                map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
                map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
                map('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[w]orkspace [l]ist folders')
            end,
        })

        -- Define Signs
        -- local signs = {
        --     Error = "",
        --     Warn = "",
        --     Hint = "",
        --     Info = ""
        -- }
        --
        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        -- end

        -- Define Icons

        local icons = {
            Text = " ",
            Method = " ",
            Function = " ",
            Constructor = " ",
            Field = " ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = " ",
            Property = " ",
            Unit = " ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
            Copilot = " ",
            Namespace = " ",
            Package = " ",
            String = " ",
            Number = " ",
            Boolean = " ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = " ",
        }

        local kinds = vim.lsp.protocol.CompletionItemKind
        for i, kind in ipairs(kinds) do
            kinds[i] = icons[kind] or kind
        end

    end
}
