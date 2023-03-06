local status, true_zen = pcall(require, 'true-zen')
if not status then return end

local openFunc = function()
    vim.opt.winbar = ""
    vim.cmd([[silent !tmux set status off]])
    require('lualine').hide()
end

local closeFunc = function()
    vim.opt.winbar = "%=%f"
    vim.cmd([[silent !tmux set status on]])
    require('lualine').hide({ unhide = true })
end
-- TODO: Lo que tendria que hacer es que en los callbacks de ataraxis es poner un set winbar= y lo de la wea de github que es cambiar el Highlight
true_zen.setup({
    modes = { -- configurations per mode
        ataraxis = {
            shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
            backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
            minimum_writing_area = { -- minimum size of main window
                width = 90,
                height = 100,
            },
            quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
            padding = { -- padding windows
                left = 35,
                right = 35,
                top = 0,
                bottom = 0,
            },
            callbacks = { -- run functions when opening/closing Ataraxis mode
                open_pre = openFunc,
                open_pos = nil,
                close_pre = nil,
                close_pos = closeFunc
            },
        },
        minimalist = {
            ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
            options = { -- options to be disabled when entering Minimalist mode
                number = false,
                relativenumber = true,
                showtabline = 0,
                signcolumn = "no",
                statusline = "",
                cmdheight = 0,
                laststatus = 0,
                showcmd = false,
                showmode = false,
                ruler = false,
                numberwidth = 1,
            },
            callbacks = { -- run functions when opening/closing Minimalist mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        narrow = {
            --- change the style of the fold lines. Set it to:
            --- `informative`: to get nice pre-baked folds
            --- `invisible`: hide them
            --- function() end: pass a custom func with your fold lines. See :h foldtext
            folds_style = "informative",
            run_ataraxis = true, -- display narrowed text in a Ataraxis session
            callbacks = { -- run functions when opening/closing Narrow mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        },
        focus = {
            callbacks = { -- run functions when opening/closing Focus mode
                open_pre = nil,
                open_pos = nil,
                close_pre = nil,
                close_pos = nil
            },
        }
    },
    integrations = {
        tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
        twilight = false, -- enable twilight (ataraxis)
        lualine = true -- hide nvim-lualine (ataraxis)
    },
})

local map = function(mode, keys, func, desc)
    desc = 'True-Zen: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

map("n", "<C-e>", ':TZAtaraxis<CR>', 'Focus Mode')
map("v", "<C-e>", ":'<,'>TZNarrow<CR>", 'Focus Mode')

-- TODO: When i will have to configure keybinds this could be useful or for "reversible zoom"
