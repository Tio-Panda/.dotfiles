-- Highlight on Yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Don't auto comment newline
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter", "BufRead" }, {
-- 	callback = function()
-- 		vim.opt.formatoptions:remove{ "c", "r", "o" }
--         -- vim.cmd([[set formatoptions-=cro]])
-- 	end,
-- })
