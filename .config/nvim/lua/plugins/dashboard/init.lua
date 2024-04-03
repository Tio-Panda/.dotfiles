return {
    {
        "goolord/alpha-nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function()

            -- ===== HEADER =====
            local section_header = {
                type = "text",
                val = require("plugins.dashboard.headers").setup(),
                opts = { position = "center", },
            }

            -- ===== SHORTCUTS =====
            local shortcuts = function()
                local keybind_opts = { silent = true, noremap = true }
                vim.api.nvim_create_autocmd({ "User" }, {
                    pattern = { "AlphaReady" },
                    callback = function(_)
                        vim.api.nvim_buf_set_keymap(0, "n", "n", "<cmd>ene <CR>", keybind_opts)
                        vim.api.nvim_buf_set_keymap(0, "n", "f", "<cmd>Telescope find_files<CR>", keybind_opts)
                        vim.api.nvim_buf_set_keymap(0, "n", "r", "<cmd>Telescope oldfiles<CR>", keybind_opts)
                        vim.api.nvim_buf_set_keymap(0, "n", "t", "<cmd>TodoTelescope keywords=TODO,FIX,HACK,BUG<CR>", keybind_opts)
                        vim.api.nvim_buf_set_keymap(0, "n", "T", "<cmd>TodoTelescope cwd=~/ keywords=TODO,FIX,HACK,BUG<CR>",
                            keybind_opts)
                        --TODO: Implementar el cambio de colorscheme
                    end,
                })
                return {
                    {
                        type = "text",
                        val = {
                            "  New File [n]     Files [f]     Recent Files [r]     To-Do [t/T]     Themes [x]",
                        },
                        opts = {
                            position = "center",
                            hl = {
                                { "Number", 1, 17 },
                                { "String", 21, 35 },
                                { "Keyword", 38, 60 },
                                { "Function", 61, 80 },
                                { "Constant", 81, 99 },
                            },
                        },
                    },
                }
            end

            local section_shortcuts = { type = "group", val = shortcuts() }

            -- ===== MRU =====
            -- TODO: Hay que combinar ya que se me confundio el startup screen 1 con el 2, pero el 2 no tiene mru cwd asi que hay que fusionar.
            local if_nil = vim.F.if_nil
            local fnamemodify = vim.fn.fnamemodify
            local filereadable = vim.fn.filereadable
            local dashboard = require("alpha.themes.dashboard")
            local cdir = vim.fn.getcwd()

            local nvim_web_devicons = {
                enabled = true,
                highlight = true,
            }

            local function get_extension(fn)
                local match = fn:match("^.+(%..+)$")
                local ext = ""
                if match ~= nil then
                    ext = match:sub(2)
                end
                return ext
            end

            local function icon(fn)
                local nwd = require("nvim-web-devicons")
                local ext = get_extension(fn)
                return nwd.get_icon(fn, ext, { default = true })
            end

            local function file_button(fn, sc, short_fn)
                short_fn = short_fn or fn
                local ico_txt
                local fb_hl = {}

                if nvim_web_devicons.enabled then
                    local ico, hl = icon(fn)
                    local hl_option_type = type(nvim_web_devicons.highlight)
                    if hl_option_type == "boolean" then
                        if hl and nvim_web_devicons.highlight then
                            table.insert(fb_hl, { hl, 0, 3 })
                        end
                    end
                    if hl_option_type == "string" then
                        table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
                    end
                    ico_txt = ico .. "  "
                else
                    ico_txt = ""
                end
                local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
                local fn_start = short_fn:match(".*[/\\]")
                if fn_start ~= nil then
                    table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
                end
                file_button_el.opts.hl = fb_hl
                return file_button_el
            end

            local default_mru_ignore = { "gitcommit" }

            local mru_opts = {
                ignore = function(path, ext)
                    return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
                end,
            }

            --- @param start number
            --- @param cwd string optional
            --- @param items_number number optional number of items to generate, default = 10
            local function mru(start, cwd, items_number, opts)
                opts = opts or mru_opts
                items_number = if_nil(items_number, 10)
                local oldfiles = {}
                for _, v in pairs(vim.v.oldfiles) do
                    if #oldfiles == items_number then
                        break
                    end
                    local cwd_cond
                    if not cwd then
                        cwd_cond = true
                    else
                        cwd_cond = vim.startswith(v, cwd)
                    end
                    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
                    if (filereadable(v) == 1) and cwd_cond and not ignore then
                        oldfiles[#oldfiles + 1] = v
                    end
                end

                local tbl = {}
                for i, fn in ipairs(oldfiles) do
                    local short_fn
                    if cwd then
                        short_fn = fnamemodify(fn, ":.")
                    else
                        short_fn = fnamemodify(fn, ":~")
                    end
                    local file_button_el = file_button(fn, tostring(i + start - 1), short_fn)
                    tbl[i] = file_button_el
                end
                return {
                    type = "group",
                    val = tbl,
                    opts = {},
                }
            end

            local section_mru = {
                type = "group",
                val = {
                    {
                        type = "text",
                        val = "Recent files",
                        opts = {
                            hl = "SpecialComment",
                            shrink_margin = false,
                            position = "center",
                        },
                    },
                    { type = "padding", val = 1 },
                    {
                        type = "group",
                        val = function()
                            return { mru(1, cdir, 9) }
                        end,
                        opts = { shrink_margin = false },
                    },
                },
            }

            -- ===== FINAL CONFIG =====
            require("alpha").setup({
                layout = {
                    section_header,
                    { type = "padding", val = 2 },
                    section_shortcuts,
                    { type = "padding", val = 2 },
                    section_mru
                    -- { type = "padding", val = 1 },
                    -- section_projects,
                },
            })
        end,
    }
}
