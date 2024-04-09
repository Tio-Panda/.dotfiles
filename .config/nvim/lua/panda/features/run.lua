-- Buscar :h events para ver todos los eventos del autocmd
-- Buscar una manera de identificar el tipo de archivo para ejecutar ciertas lineas de codigo distintas segun lo que toque
-- Agregar opciones para que se puedan ejecutar guardando la salida en algun archivo o usando un .dat para meterle data.
-- Acordarse del pobre prolog para agregar las funciones que hay que probar
-- Hacer que el comando ejecute eso por toggleTerm

--TODO: Cuando haga el modo que pida un archivo .dat, usar telescope para elegir el archivo que quiero
--TODO: Hacer como una ruleta de seleccion con un comando para que el <F5> sea el boton para ejecutar y esta ruleta decida el modo

local execLang = function(cmd)
    local langs= {
        ['py'] = "python3 %s",
        ['lua'] = "python3 %s",
        ['go'] = "go run %s",
    }

    local name = vim.fn.expand("%:t")
    local type = vim.fn.expand("%:e")

    -- print(name)
    -- print(type)
    -- print(langs[type])

    if langs[type] then
        local aux = string.format(langs[type], name)
        -- print(string.format(cmd, aux))
        vim.cmd(string.format(cmd, aux))
    else
        print "Este lenguaje no ha sido configurado"
    end
end

local execNameMake = function(cmd)
    local full_name = vim.fn.expand("%:t")
    local name = full_name:match("(.+)%..+")
    local aux = string.format(cmd, name)
    vim.cmd(aux)
end

vim.api.nvim_create_user_command("ExecFile", function()
    local cmd = [[TermExec cmd="%s" direction=float]]
    execLang(cmd)
end, {})

vim.api.nvim_create_user_command("ExecFileData", function()
    --TODO: Agregar una manera de que, con fzf o algo asi, podamos elegir el .dat que queramos.
    local cmd = [[TermExec cmd="%s < data.dat" direction=float]]
    execLang(cmd)
end, {})

vim.api.nvim_create_user_command("ExecMake", function()
    vim.cmd([[TermExec cmd="make run" direction=float]])
end, {})

vim.api.nvim_create_user_command("ExecMakeData", function()
    local cmd = [[TermExec cmd="make run TARGET=%s" direction=float]]
    execNameMake(cmd)
end, {})

--=====================
-- Keymaps
--=====================
local map = function(mode, keys, func, desc, opts)
    desc = 'Edit: ' .. desc
    opts = vim.tbl_deep_extend('force', opts or {}, { desc = desc })
    vim.keymap.set(mode, keys, func, opts)
end

map("n", "<F5>", ":ExecFile<CR>", "Execute current file")
map("n", "<leader><F5>", ":ExecFileData<CR>", "Execute current file with pre-input")
map("n", "<F6>", ":ExecMake<CR>", "Execute make run")
map("n", "<leader><F6>", ":ExecMakeData<CR>", "Execute make run with TARGET=name")
--Hacer que un C-F5 o algo asi me deje cambiar a ejecutar con el output cambiado o con algun elemento de entrada. (.dat)
