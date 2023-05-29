-- Highlight on Yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Stop newline comments
vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter", "BufRead" }, {
	callback = function()
		vim.opt.formatoptions:remove{ "c", "r", "o" }
        -- vim.cmd([[set formatoptions-=cro]])
	end,
})
