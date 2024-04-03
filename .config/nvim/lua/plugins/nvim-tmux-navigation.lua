return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        local tmux_nav = require('nvim-tmux-navigation')

        tmux_nav.setup({
            disable_when_zoomed = true
        })

        local map = function(mode, keys, func, desc)
            desc = 'Buf-Tab-Win: ' .. desc
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

        map('n', "<M-h>", tmux_nav.NvimTmuxNavigateLeft, "Move left pane")
        map('n', "<M-j>", tmux_nav.NvimTmuxNavigateDown, "Move Down pane")
        map('n', "<M-k>", tmux_nav.NvimTmuxNavigateUp, "Move up pane")
        map('n', "<M-l>", tmux_nav.NvimTmuxNavigateRight, "Move right pane")
        map('n', "<M-/>", tmux_nav.NvimTmuxNavigateLastActive, "Move last pane")
        -- map('n', "<M-Space>", tmux_nav.NvimTmuxNavigateNext)
    end
}
