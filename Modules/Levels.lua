local Levels = {}
local JSON = require("json")
local TableUtils = require("Modules/TableUtils")

function Levels.MostrarNivel(Player) -- Função para mostrar seu nível exp atual
    return "Level: " .. Player.Nivel.NivelAtual .. "\nExp: " .. Player.Nivel.Experiencia .. "/" ..
        Player.Nivel.MaximoExperiencia .. "\nPontos para distribuir: " .. Player.Nivel.Pontos

end

function Levels.GanharXP(Player, Experiencia)
    local msg = "Parabéns " .. Player.Nome .. " você ganhou " .. Experiencia .. " de experiência. "
    Player.Nivel.Experiencia = Player.Nivel.Experiencia + Experiencia
    if Player.Nivel.Experiencia >= Player.Nivel.MaximoExperiencia then
        Player.Nivel.NivelAtual = Player.Nivel.NivelAtual + 1
        Player.Nivel.Pontos = Player.Nivel.Pontos + 2
        Player.Nivel.Experiencia = 0
        Player.Nivel.MaximoExperiencia = Player.Nivel.MaximoExperiencia + math.floor(Player.Nivel.MaximoExperiencia / 5)
        msg = msg .. "\nVoce upou de nivel, seu nivel agora e " .. Player.Nivel.NivelAtual .. " ! Voce tambem ganhou 2 pontos."
    end
    local PlayerArquivo = io.open("Data/Player.json", "w")
    PlayerArquivo:write(JSON.encode(Player))
    PlayerArquivo:close()
    return msg
end

function Levels.ResetXP(Player)
    Player.Nivel.NivelAtual = 1
    Player.Nivel.Experiencia = 0
    Player.Nivel.MaximoExperiencia = 10
    Player.Nivel.Pontos = 0

    local PlayerArquivo = io.open("Data/Player.json", "w")
    PlayerArquivo:write(JSON.encode(Player))
    PlayerArquivo:close()
    return true
end

function Levels.DistribuirPontos(Player)
    local PontosTemp = math.floor(Player.Nivel.Pontos)
    -- Função para distribuir os pontos de atributos
    local function DistribuirPontos(Atributo)
        if PontosTemp == 0 then return true end
        io.write("Coloque os pontos de " .. Atributo .. ": ")
        local NumeroRecebido = io.read("*n")
        local Placeholder = io.read("*l")
        if NumeroRecebido and NumeroRecebido <= PontosTemp and NumeroRecebido >= 0 then
            Player.Atributos[Atributo] = Player.Atributos[Atributo] + NumeroRecebido
            print("\n" .. TableUtils.ListarTableDictionaries(Player.Atributos, 1) .. "Pontos restantes: " ..
                (PontosTemp - NumeroRecebido))
            PontosTemp = PontosTemp - NumeroRecebido
        else
            print("\nNumero invalido, coloque um numero entre 0 e " .. PontosTemp)
            DistribuirPontos(Atributo)
        end
    end

    -- Função para perguntar se o jogador quer redistribuir os pontos novamente
    local function RedistribuirPontos(Backup)
        print("\n\nAtributos finais:\n" .. TableUtils.ListarTableDictionaries(Player.Atributos, 1))
        print("Deseja redistribuir os pontos de atributos?")
        io.write("(S/N): ")
        local Resposta = io.read("*l")
        if Resposta:lower() == "s" then
            Player.Atributos = Backup
            return true
        else
            return false
        end
    end

    -- Função que ativa as outras funções de distribuição de pontos
    local function DistribuicaoAtributos()
        print("\nDistribua os atributos do seu personagem:\n" .. TableUtils.ListarTableDictionaries(Player.Atributos, 1) ..
            "Pontos restantes: " .. Player.Nivel.Pontos)
        local BackupPontos = {}
        for Nome, Valor in pairs(Player.Atributos) do BackupPontos[Nome] = Valor end

        repeat
            DistribuirPontos("Forca")
            DistribuirPontos("Destreza")
            DistribuirPontos("Resistencia")
        until PontosTemp == 0

        if RedistribuirPontos(BackupPontos) == true then 
            PontosTemp = math.floor(Player.Nivel.Pontos)
            DistribuicaoAtributos()
        end
        Player.Nivel.Pontos = PontosTemp
    end

    DistribuicaoAtributos()
    local PlayerArquivo = io.open("Data/Player.json", "w")
    PlayerArquivo:write(JSON.encode(Player))
    PlayerArquivo:close()
    
end

return Levels
