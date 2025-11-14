-- TODO: Tratar de arreglar el plugin de dropbar.nvim

return {}
-- return {
-- 	"Bekaboo/dropbar.nvim",
-- 	dependencies = {
-- 		-- { "nvim-tree/nvim-web-devicons", opts = {} },
-- 		"nvim-telescope/telescope-fzf-native.nvim",
--         build = "make"
-- 	},
-- 	config = function()
-- 		local dropbar_api = require("dropbar.api")
-- 		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
-- 		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
-- 		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
-- 	end,
-- }
