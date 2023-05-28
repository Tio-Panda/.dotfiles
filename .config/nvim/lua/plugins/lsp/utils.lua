local M = {}

M.ensure_installed = {
    "pyright",
    "clangd",
    "lua_ls",
}

M.configured_servers = {
    "pyright",
    "lua_ls",
    --"jsonls",
}

M.lsp_signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = ""
}

M.lsp_kinds = {
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
    Copilot = " ",
    Namespace = " ",
    Package = " ",
    String = " ",
    Number = " ",
    Boolean = " ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = " ",
}

return M
