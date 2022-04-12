local Inventario = {}
local TableUtils = require("Modules/TableUtils")
function Inventario.Mostrar(Player)
    return TableUtils.ListarTableDictionaries(Player.Inventario)
end

return Inventario