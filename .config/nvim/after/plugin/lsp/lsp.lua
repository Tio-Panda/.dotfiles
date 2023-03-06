require('mason')

local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Config ensure installed servers
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'jsonls',
    'lua_ls',
    'rust_analyzer',
})

-- Config personalizated servers
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

local config_servers = {
    'jsonls',
    'lua_ls',
    'ltex',
}

for _, server in pairs(config_servers) do
    local _, config = pcall(require, 'lsp.settings.' .. server)
    lsp.configure(server, config)
end

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        Error = "",
        Warn = "",
        Hint = "",
        Info = ""
    }
})

lsp.on_attach(function(client, bufnr)

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    local builtin = require("telescope.builtin")
    local map = function(mode, keys, func, desc)
        desc = 'LSP: ' .. desc
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    -- Setting keymaps
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

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end)

-- local cmp = require('after.plugin.lsp.cmp-config')
-- lsp.setup_nvim_cmp(cmp.setup)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
