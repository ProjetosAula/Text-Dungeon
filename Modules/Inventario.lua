local Inventario = {}

local JSON = require("json")
local TableUtils = require("Modules/TableUtils")

function Inventario.Mostrar(Player) return TableUtils.ListarTableDictionaries(Player.Inventario) end

function Inventario.Remover(Player, Item)
    local TemItem = false
    for Numero, Nome in pairs(Player.Inventario) do if Item == Nome then TemItem = Numero end end
    if TemItem == false then return false end
    table.remove(Player.Inventario, TemItem)
    local PlayerArquivo = io.open("Data/Player.json", "w")
    PlayerArquivo:write(JSON.encode(Player))
    return true
end

return Inventario

