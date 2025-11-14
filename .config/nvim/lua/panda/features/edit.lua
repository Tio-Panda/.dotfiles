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

-- TODO: Implementar bien lo de cambiar el tamaño del tab

-- Set tabstops for specified file types
-- vim.api.nvim_create_autocmd(
--   "FileType",
--   {
--     pattern = {"lua", "html", "javascript", "typescript", "yaml", "yml", "typescriptreact"},
--     callback = function()
--       vim.opt_local.tabstop = 2
--       vim.opt_local.softtabstop = 2
--       vim.opt_local.shiftwidth = 2
--       vim.opt_local.expandtab = true
--       vim.opt_local.smarttab = true
--     end
--
--   }
-- )

-- Set tabstops for specified file types
-- vim.api.nvim_create_autocmd(
--   "FileType",
--   {
--     pattern = {"go"},
--     callback = function()
--       vim.opt_local.tabstop = 4
--       vim.opt_local.shiftwidth = 4
--       vim.opt_local.expandtab = false
--       vim.opt_local.smarttab = false
--     end
--
--   }
-- )
