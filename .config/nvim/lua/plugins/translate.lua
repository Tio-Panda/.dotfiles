return {
    "uga-rosa/translate.nvim",
    config = function()

        -- Setup --
        require("translate").setup({
            default = {
                command = "google",
                output = "floating",
            },
            preset = {
                output = {
                    split = {
                        append = true,
                    },
                },

            },
        })

        -- Keybindings --
        local map = function(mode, keys, func, desc)
            desc = 'Translator: ' .. desc
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        --==================
        -- Window
        --==================
        map("n", "<leader>tc", "viw:Translate en -source=es<CR>", "[t]ranslate current word ES->EN")
        map("n", "<leader>TC", "viw:Translate es -source=en<CR>", "[T]ranslate current word EN->ES")

        map("v", "<leader>tv", ":'<,'>Translate en -source=es<CR>", "[t]ranslate [v]isual selection ES->EN")
        map("v", "<leader>TV", "<CMD>'<,'>Translate es -source=en<CR>", "[T]ranslate [V]isual selection EN->ES")

        --==================
        -- Copy in register
        --==================
        map("n", "<leader>tcw", "viw:Translate en -source=es -output=register<CR>", "[t]ranslate and [c]opy [w]ord ES->EN")
        map("n", "<leader>TCW", "viw:Translate es -source=en -output=register<CR>", "[T]ranslate and [C]opy [W]ord EN->ES")

        map("v", "<leader>tcv", "<CMD>'<,'>Translate en -source=es -output=register<CR>", "[t]ranslate [v]isual selection and [c]opy ES->EN")
        map("v", "<leader>TCV", "<CMD>'<,'>Translate es -source=en -output=register<CR>", "[T]ranslate [V]isual selection and [C]opy EN->ES")

        --==================
        -- Replace
        --==================
        map("n", "<leader>tr", "viw:Translate en -source=es -output=replace<CR>", "[t]ranslate and [r]eplace ES->EN")
        map("n", "<leader>TR", "viw:Translate es -source=en -output=replace<CR>", "[T]ranslate and [R]eplace EN->ES")

        -- map("v", "<leader>trv", "<CMD>'<,'>Translate en -source=es -output=register<CR>", "[t]ranslate and [r]eplace [v]isual selection ES->EN")
        -- map("v", "<leader>TRV", "<CMD>'<,'>Translate es -source=en -output=register<CR>", "[T]ranslate and [R]eplace [V]isual selection EN->ES")
    end
}





