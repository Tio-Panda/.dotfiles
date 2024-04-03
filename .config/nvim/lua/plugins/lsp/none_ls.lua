return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = { "stylua", "black", "isort", "prettier", "eslint_d", "jq" },
            handlers = {},
        })

        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        -- local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            debug = false,
            sources = {
                formatting.prettier.with({
                    extra_args = { "--single-quote", "--no-semi", "--jsx-single-quote" },
                    -- filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss", "json", "yaml", "html", "markdown" }
                }),
                formatting.black.with({
                    extra_args = { "--line-length", "88" },
                }),
            },
        })
    end,
}
