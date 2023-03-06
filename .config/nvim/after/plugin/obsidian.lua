local status, obsidian = pcall(require, 'obsidian')
if not status then return end

obsidian.setup({
    dir = vim.fn.expand("$OBSIDIAN"),
    completion = { nvim_cmp = true },
})

local map = function(mode, keys, func, desc, opts)
    desc = 'Obsidian: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

local followLink = function()
    if obsidian.util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end

map("n", "gf", followLink, '[g]o [f]ollow link', { noremap = false, expr = true })
