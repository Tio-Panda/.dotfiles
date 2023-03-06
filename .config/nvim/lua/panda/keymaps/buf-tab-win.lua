local map = function(mode, keys, func, desc, opts)
    desc = 'Buf-Tab-Win: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

-- TODO: Como vemos en edit, Se puede poner el comando sin exec, pero esta fn nos servira, por lo que hay que sacarla de aqui
-- hasta que la necesitemos o salga otra cosa.
local exec = function(keys)
    return function()
        local tFunc = vim.api.nvim_replace_termcodes(keys, true, false, true)
        vim.api.nvim_feedkeys(tFunc, 'n', false)
    end
end

-- TODO: Implementar el zoom revertible que opino que sera un meme pero aquitamos

-- 'Revertible zoom'
-- vim.g.r_zoom = 0
-- local rZoom = function()
--     if vim.g.r_zoom == 0 then
--         vim.g.r_zoom = 1
--         return "<CMD>tab split<CR>"
--     else
--         vim.g.r_zoom = 0
--         return "<CMD>wq<CR>"
--     end
-- end

-- ====================
-- General
-- ====================

map('n', "<C-s>", "<CMD>w<CR>", "Save file")

map('n', "<C-x>", "<CMD>bd<CR>", "Close buffer")
map('n', "<M-x>", "<CMD>bd!<CR>", "Close buffer without save")

map('n', "<C-q>", "<CMD>q<CR>", "Quit nvim")
map('n', "<M-q>", "<CMD>q!<CR>", "Quit nvim without save")
map('n', "<M-S-q>", "<CMD>wq<CR>", "Save file and quit")

-- ====================
-- Buffer
-- ====================

-- Movements
map('n', "<C-Left>", "<CMD>bp<CR>", "Move next buffer")
map('n', "<C-Right>", "<CMD>bn<CR>", "Move prev buffer")
map('n', "<C-/>", "<CMD>b#<CR>", "Move last buffer")


-- ====================
-- Tab
-- ====================

-- Movements
map('n', "<M-Left>", "<CMD>tabn<CR>", "Move next tab")
map('n', "<M-Right>", "<CMD>tabp<CR>", "Move prev tab")

-- map('n', "<M-/>", exec("g<TAB>"), "Move last tab")

-- Revertible zoom
map('n', "<leader>z", "<CMD>tab split<CR>", "Revertible zoom")
--TODO: Intercambiar entre la tab que se crea con este comando para que se ejecute segun lo que toque
--ojo, igual podriamos crear la "tab 9" y cerrar esa si es que existe, ni idea, ahi se ve.
map('n', "<leader>Z", "<CMD>tabc<CR>", "Revertible zoom 2?")

-- ====================
-- Windows
-- ====================

-- Splits
map('n', "<M-->", "<CMD>split<CR>", "Horizontally split")
map('n', "<M-\\>", "<CMD>vsplit<CR>", "Vertically split")
map('n', "<M-BS>", "<C-w>q", "Close split")

map('n', "<M-S-j>", "<C-w>3-", "Resize down")
map('n', "<M-S-k>", "<C-w>3+", "Resize up")
map('n', "<M-S-h>", "<C-w>3<", "Resize left")
map('n', "<M-S-l>", "<C-w>3>", "Resize right")
map('n', "<M-S-=>", "<C-w>=", "Resize all equal")

-- Move windows
map('n', "<leader><M-h>", exec("<C-w>H"), "Puts current window in far left")
map('n', "<leader><M-j>", exec("<C-w>J"), "Puts current window in bottom")
map('n', "<leader><M-k>", exec("<C-w>K"), "Puts current window in top")
map('n', "<leader><M-l>", exec("<C-w>L"), "Puts current window in far right")
