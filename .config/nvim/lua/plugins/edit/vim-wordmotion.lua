local map = function(mode, keys, func, desc)
    desc = 'Wordmotion: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

map("n", "cw", "ce", "Fix cw behavior")
map("n", "cW", "cE", "Fix cW behavior")