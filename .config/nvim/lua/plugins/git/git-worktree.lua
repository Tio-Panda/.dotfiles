local map = function(mode, keys, func, desc)
    desc = 'Git-Worktree: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

map("n", "<leader>gt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", '[g]it [w]orktrees menu')
map("n", "<leader>gta", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", '[g]it [w]orktree [a]dd')

return {
    change_directory_command = "cd",  -- default: "cd",
    update_on_change = true,          -- default: true,
    update_on_change_command = "e .", -- default: "e .",
    clearjumps_on_change = true,      -- default: true,
    autopush = false,                 -- default: false,
}
