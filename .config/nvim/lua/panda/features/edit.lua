-- Set spell in text files and wrap text
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "markdown", "text" },
	callback = function()
		vim.opt_local.spell = true
        vim.opt_local.textwidth = 80
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.cmd([[set nolist]])
        -- vim.opt_local.formatoptions = 'cqt'
        -- vim.opt_local.wrapmargin = 5
	end,
})
