local Interacao = {}
local JSON = require("json")

function TableTemValor(Table, Valor)
    local Valido = false

    for Nome, _ in pairs(Table) do
        if Valor == Nome then Valido = true end
    end

    return Valido
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
    ['x'] = Examinar
}

function Interacao.InteracaoJogador(String, Ambiente)
    local Acao = String:lower():match('%a+')

    if TableTemValor(InteracoesValidas, Acao) == false then return false end

    local Resto = string.sub(String, #Acao + 2, #String)
    return InteracoesValidas[Acao](Resto, Ambiente) 
end

return Interacao
