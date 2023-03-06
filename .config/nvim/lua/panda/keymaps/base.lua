vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "Q", "<nop>")

local map = function(mode, keys, func, desc, opts)
    desc = 'BASE: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

-- Movement
map("n", "<C-d>", "<C-d>zz", "Move down fix")
map("n", "<C-u>", "<C-u>zz", "Move up fix")
map("n", "n", "nzzzv", "Next search fix")
map("n", "N", "Nzzzv", "Prev search fix")

map("n", "<C-k>", "<cmd>cnext<CR>zz", "Next error")
map("n", "<C-j>", "<cmd>cprev<CR>zz", "Prev error")
map("n", "<leader>k", "<cmd>lnext<CR>zz", "Next error fix")
map("n", "<leader>j", "<cmd>lprev<CR>zz", "Prev error fix")

-- Dailys
map('n', '<ESC>', '<CMD> noh <CR>', "Delete highlight")

-- Clipboard (asbjornHaland)
map({ "n", "v" }, "<leader>y", [["+y]], "yank down to system clipboard")
map({ "n", "v" }, "<leader>Y", [["+Y]], "yank up to system clipboard")

map({ "n", "v" }, "<leader>p", [["+p]], "Paste down to system clipboard")
map({ "n", "v" }, "<leader>P", [["+P]], "Paste up to system clipboard")

map({ "n", "v" }, "<M-d>", [["_d]], "Delete without edit clipboard")
map("x", "<M-p>", [["_dP]], "Paste without edit clipboard")

-- map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- This is going to get me cancelled
-- Theprimegen uses for edit verticaly
-- map("i", "<C-c>", "<Esc>")
--
