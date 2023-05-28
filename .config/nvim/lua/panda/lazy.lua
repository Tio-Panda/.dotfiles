-- Installing Lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Sync Lazy every save in plugins folder

-- Config Lazy
local opts = {
    --defaults = { lazy = true },
    ui = {
        border = "rounded",
    },
    --checker = { enabled = true },
    debug = true,
}

-- Lazy setup
require("lazy").setup("plugins", opts)
