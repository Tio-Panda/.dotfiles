require('panda.settings')
require('panda.keymaps')
require('panda.features')
require('panda.lazy')

local status, impatient = pcall(require, "impatient")
if status then impatient.enable_profile() end

function R(name)
    require("plenary.reload").reload_module(name)
end

require('panda.colorscheme.init').setup()
