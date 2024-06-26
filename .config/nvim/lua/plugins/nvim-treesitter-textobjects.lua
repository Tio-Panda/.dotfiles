return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    config = function()
        local t = "Treesitter: "
        require('nvim-treesitter.configs').setup({
            textobjects = {
                select = {
                    enable = true,

                    lookahead = true,
                    keymaps = {

                        -- You can use the capture groups defined in textobjects.scm
                        ["a="] = { query = "@assignment.outer", desc = t .. "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = t .. "Select inner part of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = t .. "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = t .. "Select right hand side of an assignment" },

                        -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
                        ["a:"] = { query = "@property.outer", desc = t .. "Select outer part of an object property" },
                        ["i:"] = { query = "@property.inner", desc = t .. "Select inner part of an object property" },
                        ["l:"] = { query = "@property.lhs", desc = t .. "Select left part of an object property" },
                        ["r:"] = { query = "@property.rhs", desc = t .. "Select right part of an object property" },

                        ["aa"] = { query = "@parameter.outer", desc = t .. "Select outer part of a parameter/argument" },
                        ["ia"] = { query = "@parameter.inner", desc = t .. "Select inner part of a parameter/argument" },

                        ["ai"] = { query = "@conditional.outer", desc = t .. "Select outer part of a conditional" },
                        ["ii"] = { query = "@conditional.inner", desc = t .. "Select inner part of a conditional" },

                        ["al"] = { query = "@loop.outer", desc = t .. "Select outer part of a loop" },
                        ["il"] = { query = "@loop.inner", desc = t .. "Select inner part of a loop" },

                        ["af"] = { query = "@call.outer", desc = t .. "Select outer part of a function call" },
                        ["if"] = { query = "@call.inner", desc = t .. "Select inner part of a function call" },

                        ["am"] = { query = "@function.outer", desc = t .. "Select outer part of a method/function definition" },
                        ["im"] = { query = "@function.inner", desc = t .. "Select inner part of a method/function definition" },

                        ["ac"] = { query = "@class.outer", desc = t .. "Select outer part of a class" },
                        ["ic"] = { query = "@class.inner", desc = t .. "Select inner part of a class" },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = { query = "@call.outer", desc = t .. "Next function call start" },
                        ["]m"] = { query = "@function.outer", desc = t .. "Next method/function def start" },
                        ["]c"] = { query = "@class.outer", desc = t .. "Next class start" },
                        ["]i"] = { query = "@conditional.outer", desc = t .. "Next conditional start" },
                        ["]l"] = { query = "@loop.outer", desc = t .. "Next loop start" },

                        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                        ["]s"] = { query = "@scope", query_group = "locals", desc = t .. "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = t .. "Next fold" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@call.outer", desc = t .. "Next function call end" },
                        ["]M"] = { query = "@function.outer", desc = t .. "Next method/function def end" },
                        ["]C"] = { query = "@class.outer", desc = t .. "Next class end" },
                        ["]I"] = { query = "@conditional.outer", desc = t .. "Next conditional end" },
                        ["]L"] = { query = "@loop.outer", desc = t .. "Next loop end" },
                    },
                    goto_previous_start = {
                        ["[f"] = { query = "@call.outer", desc = t .. "Prev function call start" },
                        ["[m"] = { query = "@function.outer", desc = t .. "Prev method/function def start" },
                        ["[c"] = { query = "@class.outer", desc = t .. "Prev class start" },
                        ["[i"] = { query = "@conditional.outer", desc = t .. "Prev conditional start" },
                        ["[l"] = { query = "@loop.outer", desc = t .. "Prev loop start" },
                    },
                    goto_previous_end = {
                        ["[F"] = { query = "@call.outer", desc = t .. "Prev function call end" },
                        ["[M"] = { query = "@function.outer", desc = t .. "Prev method/function def end" },
                        ["[C"] = { query = "@class.outer", desc = t .. "Prev class end" },
                        ["[I"] = { query = "@conditional.outer", desc = t .. "Prev conditional end" },
                        ["[L"] = { query = "@loop.outer", desc = t .. "Prev loop end" },
                    },
                },
            },
        })

        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

        -- vim way: ; goes to the direction you were moving.
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

    end
}
