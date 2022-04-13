local JSON = require("json")
local Inventario = require("Modules/Inventario")

local PlayerArquivo = io.open("Data/Player.json", "r")
local Player = JSON.decode(PlayerArquivo:read("*all"))

print(Inventario.Mostrar(Player))
print(Inventario.Remover(Player, "pica de cavalo"))
print(Inventario.Remover(Player, "pica de urubu"))
print(Inventario.Mostrar(Player))
