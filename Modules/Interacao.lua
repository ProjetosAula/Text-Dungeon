local Interacao = {}
local JSON = require("json")

function Pronomes(Palavra, Palavra2)
    if string.sub(Palavra, #Palavra, #Palavra) == "a" then
        if string.sub(Palavra2, #Palavra2, #Palavra2) == "o" then
            Palavra2 = string.sub(Palavra2, 1, #Palavra2 - 1)
        end
        return Palavra2 .. "a"
    else
        return Palavra2
    end
end

function TableTemValor(Table, Valor)
    local Valido = false

    for Nome, _ in pairs(Table) do
        if Valor == Nome then Valido = true end
    end

    return Valido
end

function Olhar(Resto, Ambiente)
    local Entradas = {}

    for Nome, Valor in pairs(Ambiente.lados) do
        if Valor.Estado ~= nil then
            table.insert(Entradas, 'Voce ve uma ' .. Valor.Tipo .. ' ao ' .. Nome .. ' ' .. Valor.Estado .. '.')
        else 
            table.insert(Entradas, 'Voce ve uma ' .. Valor.Tipo .. ' ao ' .. Nome .. '.')
        end
    end

    local TextoObjetos = ""

    for Nome, Valor in pairs(Ambiente.objetos) do
        TextoObjetos = TextoObjetos .. "Voce ve " .. Pronomes(Nome, "um") .. " " .. Nome .. " " .. Pronomes(Valor.posicao, "no") .. " " .. Valor.posicao .. " " .. Pronomes(Valor.lugar, "do") .. " " .. Valor.lugar .. ".\n"
    end

    return "Voce esta " .. Pronomes(Ambiente.tipo, "num") .. " " .. Ambiente.tipo .. ", de tamanho " .. Ambiente.tamanho .. ".\n" .. table.concat(Entradas, "\n") .. "\n" .. TextoObjetos
end

function Examinar(Resto, Ambiente)
    local ObjetosArquivo = io.open("Data/Objetos.json", "r")
    local Objetos = JSON.decode(ObjetosArquivo:read("*all"))
    ObjetosArquivo:close()

    if TableTemValor(Ambiente.objetos, Resto) == false then return 'Este objeto nao existe' end

    return Objetos[Resto].descricao
end

local InteracoesValidas = {
    ['examinar'] = Examinar,
    ['x'] = Examinar,
    ['olhar'] = Olhar,
    ['l'] = Olhar,
}

function Interacao.InteracaoJogador(String, Ambiente)
    local Acao = String:lower():match('%a+')

    if TableTemValor(InteracoesValidas, Acao) == false then return false end

    local Resto = string.sub(String, #Acao + 2, #String)
    return InteracoesValidas[Acao](Resto, Ambiente)
end

return Interacao
