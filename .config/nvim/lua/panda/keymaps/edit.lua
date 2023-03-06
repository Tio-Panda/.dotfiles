local map = function(mode, keys, func, desc, opts)
    desc = 'Edit: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

-- Quick fix
map("v", "J", ":m '>+1<CR>gv=gv", "Move highlighted line down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move highlighted line up")
map("n", "J", "mzJ`z", "Delete \\n with cursor fix")

map("n", "U", "<C-r>", "Redo")

-- Substitute
map("n", "<leader>rac", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "[r]eplace [a]ll [c]urrent matches")

-- Text formating
map("n", "<leader>f", "gq", "[f]ormat text")

-- Spell checker
--TODO: Hacer que el spell check sea solo esp, en o ambos
map("n", "<F12>", ":set spell!<CR>", "Toggle spell check")
map("n", "<leader>.sle", ":set spell spelllang=en_us<CR>", ".[s]et spell check [l]anguage in [e]nglish")
map("n", "<leader>.sls", ":set spell spelllang=es_es<CR>", ".[s]et spell check [l]anguage in [s]panish")
map("n", "<leader>.slb", ":set spell spelllang=es_es,en_us<CR>", ".[s]et spell check [l]anguage in [b]oth")
map("n", "<leader>.sc", ":spellr<CR>", ".[s]pread last spell [c]hange around the window")
map("n", "<leader><Enter>", "z=1<CR><CR>:spellr<CR>", "Correct current word and spread change around the window", { silent = true })
