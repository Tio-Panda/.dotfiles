return {
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
}

-- TODO: Dejar esto en la carpeta de colorscheme
-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
