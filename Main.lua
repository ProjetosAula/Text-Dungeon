-- Table infos personagem
local Personagem = {
    ["Nome"] = nil,
    ["Genero"] = nil,
    ["Raca"] = nil,
    ["Classe"] = nil,
    ["Equipamentos"] = {},
    ["Atributos"] = {
        -- Usar 1 como valor base pro sistema.
        ["Forca"] = 1,
        ["Destreza"] = 1,
        ["Inteligencia"] = 1,
        ["Resistencia"] = 1,
        ["Carisma"] = 1
    }
}
local Erros = {
    [1]= 'Por favor distribua 10 pontos no total'
}
-- Criação de personagem

print("Crie seu personagem:")
io.write("Nome: ")
Personagem["Nome"] = io.read("l")
io.write("Genero: ")
Personagem["Genero"] = io.read("l")
io.write("Raca: ")
Personagem["Raca"] = io.read("l")

-- Distribuição de pontos

print("Distribua um total de 10 pontos para os atributos")

function SomarTable(Table)
    local SomaTotal = 0
    for Nome, Valor in pairs(Table) do
        SomaTotal = SomaTotal + Valor
    end
    return SomaTotal
end

function ConcatenarDic(Table)
    local TextoFinal = ""
    for Nome, Valor in pairs(Table) do
        TextoFinal = TextoFinal .. "    " .. Nome .. ": " .. Valor .. "\n"
    end
    return TextoFinal
end

function DistruibuicaoDePontos()
        local PontosTemp = {
            ["Forca"] = 1,
            ["Destreza"] = 1,
            ["Inteligencia"] = 1,
            ["Resistencia"] = 1,
            ["Carisma"] = 1
        }
        local x= 15

        print("Atributos totais:\n" .. ConcatenarDic(PontosTemp))

        io.write('Forca: ')
        local VForca = io.read('n');
        local PlaceHolder = io.read()
        PontosTemp["Forca"]= VForca + PontosTemp["Forca"]
        print('Pontos para distribuir: '.. x-SomarTable(PontosTemp), '\n')

        io.write('Destreza: ')
        local VDestreza = io.read('n');
        local PlaceHolder = io.read()
        PontosTemp["Destreza"]= VDestreza + PontosTemp["Destreza"]
        print('Pontos para distribuir: '.. x-SomarTable(PontosTemp), '\n')

        io.write('Inteligencia: ')
        local VInteligencia = io.read('n');
        local PlaceHolder = io.read()
        PontosTemp["Inteligencia"]= VInteligencia + PontosTemp["Inteligencia"]
        print('Pontos para distribuir: '.. x-SomarTable(PontosTemp), '\n')

        io.write('Resistencia: ')
        local VResistencia = io.read('n');
        local PlaceHolder = io.read()
        PontosTemp["Resistencia"]= VResistencia + PontosTemp["Resistencia"]
        print('Pontos para distribuir: '.. x-SomarTable(PontosTemp), '\n')

        io.write('Carisma: ')
        local VCarisma = io.read('n');
        local PlaceHolder = io.read()
        PontosTemp["Carisma"]= VCarisma + PontosTemp["Carisma"]
        print('Pontos para distribuir: '.. x-SomarTable(PontosTemp), '\n')

        if SomarTable(PontosTemp) == 15 then 
            print('Pontos distribuidos com sucesso\n' .. ConcatenarDic(PontosTemp))
        else 
            print(Erros[1], ' \n'); DistruibuicaoDePontos() 
        end

        print('Deseja redistribuir os pontos? [Sim] [Nao]'); local redistribuicao = string.lower(io.read('l'))
        if redistribuicao == 'sim' then DistruibuicaoDePontos() end

        Personagem['Atributos']["Forca"]= PontosTemp["Forca"]
        Personagem['Atributos']["Destreza"]= PontosTemp["VDestreza"]
        Personagem['Atributos']["Inteligencia"]= PontosTemp["VInteligencia"] 
        Personagem['Atributos']["Resistencia"]= PontosTemp["VResistencia"]
        Personagem['Atributos']["Carisma"]= PontosTemp["Carisma"]
end

DistruibuicaoDePontos()

--[[ --? Distribuição de pontos define a classe do personagem
io.write("Classe: ");
Personagem["Classe"] = io.read("l")
]]
