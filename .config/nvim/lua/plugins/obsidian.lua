return {
    "epwalsh/obsidian.nvim",
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()

        -- Config --
        require("obsidian").setup({
            dir = vim.fn.expand("$OBSIDIAN"),
            completion = { nvim_cmp = true },
        })


        -- Keybindings --
        local map = function(mode, keys, func, desc, opts)
            desc = 'Obsidian: ' .. desc
            opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
            vim.keymap.set(mode, keys, func, opts)
        end

        local obsidian = require("obsidian")

        local followLink = function()
            if obsidian.util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end

        map("n", "gf", followLink, '[g]o [f]ollow link', { noremap = false, expr = true })
    end
}
