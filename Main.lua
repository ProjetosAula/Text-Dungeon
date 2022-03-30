local Player = {
    Nome = nil,
    Raca = nil,
    Classe = nil,
    Atributos = {
        Forca = 0,
        Destreza = 0,
        Resistencia = 0
    },
    Equipamentos = {}
}

local Racas = {
    Humano = {
        Forca = 2,
        Destreza = 2,
        Resistencia = 2
    },
    Elfo = {
        Forca = 2,
        Destreza = 3,
        Resistencia = 1
    },
    Anao = {
        Forca = 2,
        Destreza = 1,
        Resistencia = 3
    },
    Gnomo = {
        Forca = 1,
        Destreza = 4,
        Resistencia = 1
    }
}

local Classes = {
    Guerreiro = {
        Forca = 2,
        Destreza = 0,
        Resistencia = 0
    },
    Ladino = {
        Forca = 0,
        Destreza = 2,
        Resistencia = 0
    },
    Paladino = {
        Forca = 0,
        Destreza = 0,
        Resistencia = 2
    }
}

-- Protótipo de criação de personagem


-- Checa se uma string é uma palavra valida
local function StringValida(String, QuantidadeLetras)
    if QuantidadeLetras == nil then
        QuantidadeLetras = 1 -- Se não for passado, assume que é 1
    end
    if String == nil or #String < QuantidadeLetras or String:match("[%p%d]") then return false end
    return true -- retorna true se a string existe, não é vazia e não contém caracteres especiais
end


repeat -- Loop para checar se o nome é valido
    io.write("Nome: ")
    Player.Nome = io.read("l")
    local NomeValido = StringValida(Player.Nome, 3)
    if not NomeValido then
        print("Nome invalido, coloque um nome com mais de 3 letras e sem caracteres especiais.")
    end
until NomeValido