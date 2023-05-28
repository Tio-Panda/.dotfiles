local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = function(mode, keys, func, desc)
    desc = 'Harpoon: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

map("n", "<leader><tab>", mark.add_file, 'Mark file')
map("n", "<leader><leader>", ui.toggle_quick_menu, 'See all marked files')

map("n", "<M-1>", function() ui.nav_file(1) end, 'Nav to mark [1]')
map("n", "<M-2>", function() ui.nav_file(2) end, 'Nav to mark [2]')
map("n", "<M-3>", function() ui.nav_file(3) end, 'Nav to mark [3]')
map("n", "<M-4>", function() ui.nav_file(4) end, 'Nav to mark [4]')
map("n", "<M-5>", function() ui.nav_file(5) end, 'Nav to mark [5]')
