local map = function(mode, keys, func, desc, opts)
    desc = 'Util: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

-- Scripts
-- TODO: Sacar este comando ya que se puede usar con el prefix de tmux
-- map("n", "<M-f>", "<CMD>!tmux neww ~/.scripts/tmux/tmux-sessionizer<CR>", "Open sessionizer", { silent = true })

-- Chmod
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", "Make file executable", { silent = true })
