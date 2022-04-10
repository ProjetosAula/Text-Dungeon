local Levels = {}
local JSON = require("json")

function Levels.MostrarNivel(Player) -- Função para mostrar seu nível exp atual
    return "Level: " .. Player.Nivel.NivelAtual .. "\n" .. "Exp: " .. Player.Nivel.Experiencia .. "/" .. Player.Nivel.MaximoExperiencia

end

function Levels.GanharXP(Player, Experiencia)
    Player.Nivel.Experiencia = Player.Nivel.Experiencia + Experiencia
    if Player.Nivel.Experiencia >= Player.Nivel.MaximoExperiencia then
        Player.Nivel.NivelAtual = Player.Nivel.NivelAtual + 1 
        Player.Nivel.Experiencia = 0 
        Player.Nivel.MaximoExperiencia =  Player.Nivel.MaximoExperiencia + math.floor(Player.Nivel.MaximoExperiencia/5)
    end
    local PlayerArquivo = io.open("Data/Player.json", "w")
    PlayerArquivo:write(JSON.encode(Player))
end

return Levels
