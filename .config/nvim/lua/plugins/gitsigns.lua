return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {

				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,

				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},

			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local map = function(mode, keys, func, desc, opts)
					desc = "Gitsigns: " .. desc
					opts = vim.tbl_deep_extend("force", opts or {}, { buffer = bufnr, desc = desc })
					vim.keymap.set(mode, keys, func, opts)
				end

				-- Navigation
				map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", "Next hunk", { expr = true })
				map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", "Prev hunk", { expr = true })

				-- Actions
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "[h]unk [s]tage")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "[h]unk [r]reset")
				map("n", "<leader>hS", gs.stage_buffer, "[S]tage buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "[h]unk [u]ndo stage")
				map("n", "<leader>hR", gs.reset_buffer, "[R]eset buffer")
				map("n", "<leader>hp", gs.preview_hunk, "[h]unk [p]review")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "[h]unk [b]lame")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "[t]oggle current line [b]lame")
				map("n", "<leader>hd", gs.diffthis, "[d]iff this")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "[D]iff this change")
				map("n", "<leader>tD", gs.toggle_deleted, "[t]oggle [D]eleted")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		})
	end,
}
