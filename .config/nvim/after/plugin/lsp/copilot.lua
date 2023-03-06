local status, copilot = pcall(require, 'copilot')
if not status then return end

local status2, copilot_cmp = pcall(require, 'copilot_cmp')
if not status2 then return end

--====================
-- copilot
--====================

-- require('copilot').setup({})
-- vim.defer_fn(function()
--     require("copilot").setup {
--         plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
--     }
-- end, 100)
--

copilot.setup({
-- require('copilot').setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
        -- ["*"] = true,
        yaml = false,
        xml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = vim.fn.expand("$HOME") .. '/.nvm/versions/node/v16.15.0/bin/node', -- Node.js version must be > 16.x
    server_opts_overrides = {
        trace = "verbose",
        settings = {
            advanced = {
                listCount = 10, -- #completions for panel
                inlineSuggestCount = 3, -- #completions for getCompletions
            }
        },
    }
})

--====================
-- copilot_cmd
--====================
local cop_format = require("copilot_cmp.format")
copilot_cmp.setup({
    method = "getCompletionsCycling",
    formatters = {
        label = cop_format.format_label_text,
        insert_text = cop_format.format_insert_text,
        preview = cop_format.deindent,
    },
})

--TODO: Revisar el :h copilot para configurar y setarlo bien junto a cmp y zsh
--Como idea, la manera que deje para aceptar la suggestion de copilot seria la misma para aceptar la suggestion de zsh
--Usar F1 para activar/desactivar Copilot
--

-- local copilot_on = true
-- vim.api.nvim_create_user_command("CopilotToggle", function()
--     if copilot_on then
--         vim.cmd("Copilot disable")
--         print("Copilot OFF")
--     else
--         vim.cmd("Copilot enable")
--         print("Copilot ON")
--     end
--     copilot_on = not copilot_on
-- end, { nargs = 0 })

-- local map = function(mode, keys, func, desc, opts)
--     desc = 'Copilot: ' .. desc
--     opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
--     vim.keymap.set(mode, keys, func, opts)
-- end
--
-- -- map("n", "<M-y>", ":copilot#Accept('\\<CR>')<CR>", "Accept suggestion")
-- map("i", "<M-[>", "<Plug>(copilot-previous)", "Previous suggestion")
-- map("i", "<M-]>", "<Plug>(copilot-next)", "Next suggestion")
-- map("i", "<C-]>", "<Plug>(copilot-dismiss)", "Dismiss the current suggestion")
-- map("n", "<leader>C", ":CopilotToggle<CR>", "Toggle [C]opilot", { noremap = true })
-- map("n", "<leader>c", "<Plug>(copilot-suggest)", "Request a suggestion")

--NOTE: In case that i had to back to copilot.vim use this

-- map("i", "<Right>", 'copilot#Accept("<CR>")', "Accept suggestion", { silent = true, expr = true })
-- https://www.reddit.com/r/neovim/comments/w2exp5/is_there_a_way_to_map_a_key_to_toggle_the_github/
