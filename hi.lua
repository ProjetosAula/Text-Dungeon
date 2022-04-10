local Levels = require("Modules/Levels")
local JSON = require("json")
local PlayerArquivo = io.open("Data/Player.json", "r")
local Player = JSON.decode(PlayerArquivo:read("*all"))

print(Levels.MostrarNivel(Player))
print(Levels.GanharXP(Player, 5))
print(Levels.MostrarNivel(Player))