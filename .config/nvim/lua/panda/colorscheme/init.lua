local M = {}

-- Setting config
M.config = {
	colorscheme = 'gruvbox',
	variant = 'dark',
	contrast = 'hard',
	undercurl = true,
	underline = true,
	bold = true,
	italic = false,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
}

M.setup = function()
    -- Verify nvim version
    if vim.version().minor < 7 then
        vim.notify_once("Colorsheme: You must use neovim 0.7 or higher")
        return
    end

    -- Reset colors
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = M.config.colorscheme
    vim.o.background = M.config.variant

    local p = require('panda.colorscheme.palette')
    p.set(M.config.colorscheme, M.config.variant, M.config.contrast)

    -- Add highlights
    local groups = require('panda.colorscheme.groups').setup()

    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
