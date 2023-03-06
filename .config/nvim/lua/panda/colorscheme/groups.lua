-- neovim terminal mode colors
local function setTerminalColors(c)
    vim.g.terminal_color_0 = c.base00
    vim.g.terminal_color_8 = c.base03
    vim.g.terminal_color_1 = c.base0D
    vim.g.terminal_color_9 = c.base08
    vim.g.terminal_color_2 = c.base0B
    vim.g.terminal_color_10 = c.base0B
    vim.g.terminal_color_3 = c.base0A
    vim.g.terminal_color_11 = c.base0A
    vim.g.terminal_color_4 = c.base0D
    vim.g.terminal_color_12 = c.base0D
    vim.g.terminal_color_5 = c.base0E
    vim.g.terminal_color_13 = c.base0E
    vim.g.terminal_color_6 = c.base0C
    vim.g.terminal_color_14 = c.base0C
    vim.g.terminal_color_7 = c.base04
    vim.g.terminal_color_15 = c.base07
end


local M = {}

function M.setup()
    local c = require('panda.colorscheme.palette').palette
    local groups = require('panda.colorscheme.groups.base')

    setTerminalColors(c)

    return groups
end

return M

