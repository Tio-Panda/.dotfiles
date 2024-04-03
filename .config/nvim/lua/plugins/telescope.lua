return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        -- Config --
        telescope.setup({
            defaults = {

                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },

                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-q>"] = actions.close,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,

                        ["<CR>"] = actions.select_default,
                        ["<M-_>"] = actions.select_horizontal,
                        ["<M-\\>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<s-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-l>"] = actions.complete_tag,
                        --["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    },

                    n = {
                        ["<C-q>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<M-_>"] = actions.select_horizontal,
                        ["<M-\\>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,

                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<s-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        -- TODO: Arreglar las quickfix y saber ocuparlas
                        --
                        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,

                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,

                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,

                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,

                        ["?"] = actions.which_key,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                }
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = 'smart_case', -- "smart_case" | "ignore_case" | "respect_case"
                },
            },
        })

        -- Add-Ons --
        telescope.load_extension('fzf')
        telescope.load_extension("git_worktree")

        -- TODO: Ver las configuraciones para mantener sesiones y si me sirve.
        -- telescope.load_extension("scope")

        -- Keymaps --
        -- Base function for keymaps
        local map = function(mode, keys, func, desc)
            desc = 'Telescope: ' .. desc
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        -- TODO: COLOCAR distintos layouts para cada menu segun lo que convenga.
        -- Keymaps
        map('n', '<C-p>', builtin.find_files, 'Search files')

        map('n', '<M-p>', builtin.oldfiles, 'Find recently opened files')
        map('n', '<leader>sb', builtin.buffers, '[s]earh existing [b]uffers')
        map('n', '<leader>/', builtin.current_buffer_fuzzy_find, 'Fuzzily search in current buffer')

        map('n', '<leader>sk', builtin.keymaps, '[s]earch [k]eymaps')
        map('n', '<leader>sf', builtin.find_files, '[s]earch [f]iles')
        map('n', '<leader>sh', builtin.help_tags, '[s]earch [h]elp')
        map('n', '<leader>sc', builtin.grep_string, '[s]earch [c]urrent Word')
        map('n', '<leader>sg', builtin.git_files, '[s]earch in [g]it')
        map('n', '<leader>sl', builtin.live_grep, '[s]earch by [l]ive Grep')
        map('n', '<leader>sd', builtin.diagnostics, '[s]earch [d]iagnostics')
        map('n', '<leader>ss',
            function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
            '[s]earch word by [s]tring')
            end,
}


