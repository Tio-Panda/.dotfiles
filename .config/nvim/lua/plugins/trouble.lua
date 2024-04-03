return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        icons = false,
        fold_open = "v",          -- icon used for open folds
        fold_closed = ">",        -- icon used for closed folds
        indent_lines = false,     -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = false     -- enabling this will use the signs defined in your lsp client
    },
    config = function()
        local trouble = require("trouble")

        local map = function(mode, keys, func, desc)
            desc = 'Trouble: ' .. desc
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        map("n", "<leader>tt", function() trouble.toggle("workspace_diagnostics") end, "[t]oggle [t]rouble")
        map("n", "]t", function() trouble.next({ jump = true, skip_groups = true }) end, "Next diagnostic")
        map("n", "[t", function() trouble.previous({ jump = true, skip_groups = true }) end, "Previous diagnostic")
    end
}
