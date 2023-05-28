local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = false,
	})

	---- sign column
    local signs = require("plugins.lsp.utils").lsp_signs

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions

	local builtin = require("telescope.builtin")
    local map = function(mode, keys, func, desc)
        desc = 'LSP: ' .. desc
        vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
    end

    map('n', '[d', vim.diagnostic.goto_prev, 'Prev diagnostic')
    map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
    map('n', '<leader>e', vim.diagnostic.open_float, 'Open diagnostic in float window')
    map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic in loclist')

    map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

    map('n', '<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
    map('n', '<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    map('n', '<C-f>', vim.lsp.buf.format, '[f]ormat code')

    map('n', 'gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
    map('n', 'gr', builtin.lsp_references, '[g]oto [r]eferences')
    map('n', 'gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
    map('n', 'gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')

    map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    map('n', '<leader>ds', builtin.lsp_document_symbols, '[d]ocument [s]ymbols')
    map('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')

    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd Folder')
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove Folder')
    map('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[w]orkspace [l]ist folders')

	-- show diagnostics in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
    
end

M.on_attach = function(client, bufnr)
	if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end
    
    -- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

return M