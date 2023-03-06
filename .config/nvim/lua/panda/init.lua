require('panda.plugins')
require('panda.set')
require('panda.keymaps')
require('panda.features')

local status, impatient = pcall(require, "impatient")
if status then impatient.enable_profile() end

function R(name)
    require("plenary.reload").reload_module(name)
end

require('panda.colorscheme.init').setup()
