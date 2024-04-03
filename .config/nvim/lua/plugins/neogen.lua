return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local neogen = require("neogen")
        neogen.setup({ snippet_engine = "LuaSnip" })

        local map = function(mode, keys, func, desc)
            desc = 'Neogen: ' .. desc
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        map("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end, "[n]eogen [f]unction")

        map("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end, "[n]eogen [t]ype")

    end
}
