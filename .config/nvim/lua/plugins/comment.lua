--TODO: Agregar cosas a esta config y algunas features de la pagina de github oficial.
return {
    'numToStr/Comment.nvim',
    config = function()
        require("Comment").setup({
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                basic = true,
                extra = true,
            },
        })

        local map = function(mode, keys, func, desc, opts)
            desc = 'Comment: ' .. desc
            opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
            vim.keymap.set(mode, keys, func, opts)
        end

        map('n', 'gbb', require('Comment.api').toggle.blockwise.current, 'Toggle [b]lockwise comment')

    end

}
