vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

--vim.scriptencoding = "uft-8"
-- vim.opt.encoding = "uft-8"
--vim.opt.fileencoding = "uft-8"

vim.opt.fileformat = "unix"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.winbar= "%=%f"
vim.opt.laststatus = 3
-- TODO: Asegurarme de que highlight WinSeparator guibg=NONE

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 0
vim.opt.wrap = false

vim.opt.mouse = "a"

-- NOTE: In case of spell-langs won't download, comment next 2 lines and restart
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.showmode = false
vim.opt.cmdheight = 1

-- vim.opt.syntax = 'on'
-- NOTE: Right now, we can toggle spell check and is always activated in .tex, .md, .tex
vim.opt.spell = false
-- vim.opt.spelloptions = 'camel'
vim.opt.spelllang = { 'en_us', 'es_es' }
vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"

-- Folder to save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Shared clipboard
--o.clipboard = 'unnamedplus'

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
