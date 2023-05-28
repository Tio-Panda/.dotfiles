local map = function(mode, keys, func, desc)
    desc = 'NvimTree: ' .. desc
    vim.keymap.set(mode, keys, func, { desc = desc })
end

map('n', '<TAB>', '<CMD>NvimTreeToggle<CR>', 'NvimTree toggle')

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
})

return {
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        width = 35,
        side = 'left',
        mappings = {
            custom_only = true,
            list = {
                { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
                { key = "<C-e>",                          action = "edit_in_place" },
                { key = "O",                              action = "edit_no_picker" },
                { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
                { key = "<C-v>",                          action = "vsplit" },
                { key = "<C-x>",                          action = "split" },
                { key = "<C-t>",                          action = "tabnew" },
                { key = "<",                              action = "prev_sibling" },
                { key = ">",                              action = "next_sibling" },
                { key = "P",                              action = "parent_node" },
                { key = "<BS>",                           action = "close_node" },
                { key = "P",                              action = "preview" },
                { key = "K",                              action = "first_sibling" },
                { key = "J",                              action = "last_sibling" },
                { key = "I",                              action = "toggle_git_ignored" },
                { key = "H",                              action = "toggle_dotfiles" },
                { key = "U",                              action = "toggle_custom" },
                { key = "R",                              action = "refresh" },
                { key = "a",                              action = "create" },
                { key = "d",                              action = "remove" },
                { key = "D",                              action = "trash" },
                { key = "r",                              action = "rename" },
                { key = "<C-r>",                          action = "full_rename" },
                { key = "x",                              action = "cut" },
                { key = "c",                              action = "copy" },
                { key = "p",                              action = "paste" },
                { key = "y",                              action = "copy_name" },
                { key = "Y",                              action = "copy_path" },
                { key = "gy",                             action = "copy_absolute_path" },
                { key = "[e",                             action = "prev_diag_item" },
                { key = "[c",                             action = "prev_git_item" },
                { key = "]e",                             action = "next_diag_item" },
                { key = "]c",                             action = "next_git_item" },
                { key = "-",                              action = "dir_up" },
                { key = "s",                              action = "system_open" },
                { key = "f",                              action = "live_filter" },
                { key = "F",                              action = "clear_live_filter" },
                { key = "TAB",                            action = "close" },
                { key = "W",                              action = "collapse_all" },
                { key = "E",                              action = "expand_all" },
                { key = "S",                              action = "search_node" },
                { key = ".",                              action = "run_file_command" },
                { key = "<C-k>",                          action = "toggle_file_info" },
                { key = "h",                              action = "toggle_help" },
                { key = "m",                              action = "toggle_mark" },
                { key = "bmv",                            action = "bulk_move" },
            },
        },
    },
    filters = {
        dotfiles = true,
        custom = { '.git$', 'node_modules$', '^target$' },
    },
    git = {
        ignore = false,
    },
    actions = {
        use_system_clipboard = true,
        open_file = { quit_on_open = true },
    },
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            },
            glyphs = {
                git = {
                    unstaged = '~',
                    staged = '+',
                    unmerged = '!',
                    renamed = '≈',
                    untracked = '?',
                    deleted = '-',
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
}