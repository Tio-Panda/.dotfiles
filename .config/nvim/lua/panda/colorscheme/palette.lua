-- Importar todas las weas segun el nombre que le indiquemos
local M = {}

function M.set(palette, variant, contrast)

    local variants = require(string.format('panda.colorscheme.palettes.%s', palette))
	M.palette = variants[string.format('%s_%s', variant, contrast)]

end

return M