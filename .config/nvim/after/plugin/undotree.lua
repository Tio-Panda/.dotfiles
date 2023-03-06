local map = function(mode, keys, func, desc)
    desc = 'Undotree: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
map("n", "<M-u>", vim.cmd.UndotreeToggle, '[u]ndotree toggle')
