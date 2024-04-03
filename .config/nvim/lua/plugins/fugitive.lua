return {
    'tpope/vim-fugitive',
    config = function()

        local map = function(mode, keys, func, desc, opts)
            desc = 'Fugitive: ' .. desc
            opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
            vim.keymap.set(mode, keys, func, opts)
        end

        map("n", "<M-g>", vim.cmd.Git, 'Open [g]it fugitive')
        local nvimFugitive = vim.api.nvim_create_augroup("nvimFugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = nvimFugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}

                map("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, 'Git [p]ush', opts)

                -- rebase always
                map("n", "<leader>P", function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, 'Git [P]ull w/ rebase', opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                map("n", "<leader>o", ":Git push -u origin ", 'Git push to [o]rigin', opts);
            end,
        })

        -- TODO: Crear un commando o un bash script que haga las actualizaciones de obsidian solas
    end,
}



