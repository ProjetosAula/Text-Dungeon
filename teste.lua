local Interacao = require('Modules/Interacao')

local Sala_Das_Prima = {

    tipo = "sala",
    tamanho = "medio",
    lados = {
        
        norte = {
            Tipo = "porta",
            Aberto = true,
            Estado = 'que esta aberta'
        },

        sul = {
            Tipo = "parede",
            Aberto = false,
            Estado = nil
        },

        leste = {
            Tipo = "porta",
            Aberto = true,
            Estado = 'que esta aberta'
        },

        oeste = {
            Tipo = "porta",
            Aberto = false,
            Estado = 'que esta trancada' 
        },
    },
    objetos = {
        mesa = {
            lugar = "sala",
            posicao = "meio",
        },

        espada = {
            lugar = "mesa",
            posicao = "canto",
        },

        martelo = {
            lugar = "vaso",
            posicao = "quina",
        }
    }
}



print(Interacao.InteracaoJogador('x espada', Sala_Das_Prima))
print(Interacao.InteracaoJogador('x mesa', Sala_Das_Prima))
print(Interacao.InteracaoJogador('x banana', Sala_Das_Prima))
print(Interacao.InteracaoJogador("l", Sala_Das_Prima))