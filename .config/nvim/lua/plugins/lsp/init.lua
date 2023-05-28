return {
    {
        "neovim/nvim-lspconfig",
        --event = "BufReadPre",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            
            local utils = require("plugins.lsp.utils")
            local lsp = require("plugins.lsp.lsp")
            lsp.setup()

            mason_lspconfig.setup({
                ensure_installed = utils.ensure_installed,
            })

            local handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = lsp.on_attach,
                        capabilities = lsp.capabilities,
                    })
                end,
            }

            for _, server in pairs(utils.configured_servers) do
                local _, custom_settings = pcall(require, 'plugins.lsp.servers.' .. server)
                handlers[server] = function()
                    lspconfig[server].setup({
                        on_attach = lsp.on_attach,
                        capabilities = lsp.capabilities,
                        settings = custom_settings,
                    })
                end
            end

            mason_lspconfig.setup_handlers(handlers)
        end,
    },

    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            local opts = require("plugins.lsp.mason")
            require("mason").setup(opts)

            --[[ local mr = require("mason-registry")
            local utils = require("plugins.lsp.utils")
            local packages = utils.ensure_installed

            local function ensure_installed()
                for _, package in ipairs(packages) do
                    local p = mr.get_package(package)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end ]]
        end,
    },
}