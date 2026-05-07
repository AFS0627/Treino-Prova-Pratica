

// Tempo total:
// 90 minutos

// 45 minutos -> lógica
// 45 minutos -> SQL

// TAREFA 01 - Lógica de Programação (Nível Hard)

// Cenário

// Uma prefeitura deseja controlar os atendimentos
// realizados em uma unidade de saúde

// Cada atendimento possui:

// código do atendimento
// nome do paciente
// idade
// especialidade
// prioridade
// 1 = baixa
// 2 = média
// 3 = alta
// tempo de atendimento em minutos

// REQUISITOS

// PARTE 1 - Estrutura

// Criar:

// Registro:
// Atendimento

// com os campos necessários

// Vetor:
// vetor[1..15] de Atendimento

// PARTE 2 - Entrada de dados

// Ler os dados dos 15 atendimentos

// PARTE 3 - Processamentos

// A) Validação de dados

// Não permitir:

// idade menor que 0
// prioridade fora de 1 até 3
// tempo menor ou igual a 0

// Repetir a leitura até ficar válida

// B) Estatísticas

// Mostrar:

// 1.
// Quantidade de atendimentos
// com prioridade alta

// 2.
// Média do tempo de atendimento

// 3.
// Paciente com maior tempo de atendimento

// 4.
// Percentual de pacientes idosos
// idade maior ou igual a 60

// C) Busca

// Solicitar:
// código do atendimento

// Realizar:
// busca linear

// Exibir:
// todos os dados

// D) Ordenação múltipla

// Ordenar por:

// prioridade decrescente

// Em caso de empate:
// maior tempo primeiro

// E) Modularização obrigatória

// Criar:

// 1 função para média
// 1 função para percentual
// 1 procedimento para ordenação
// 1 procedimento para busca

// F) Matriz

// Criar:

// matriz[1..3,1..2]

// Onde:

// Linhas:
// prioridades

// Colunas:

// menores de 60 anos
// maiores ou iguais a 60 anos

// Exibir a matriz final


Algoritmo "Atendimentos"


tipo atendimento = registro
     cod: inteiro
     nome: caractere
     idade: inteiro
     especialidade: caractere
     prioridade: inteiro
     temp: inteiro
fimregistro

var
   a: vetor [1..15] de atendimento
   i,j,somatemp,countalta,idosos,atendimentos,codbusca,idoso1,idoso2,idoso3: inteiro
   maiortempo: atendimento
   final: vetor [1..3, 1..2] de inteiro
   aux: atendimento
   media,porcentagemIdosos: real
   


funcao calculaMedia (soma: inteiro; total: inteiro): real
inicio
      se (soma = 0) ou (total = 0) entao
         retorne 0
      senao
           retorne soma / total
      fimse
fimfuncao


funcao calculaPorcentagem ( total: real; taxa: real): real
inicio
      se (taxa = 0) ou (total = 0) entao
         retorne 0
      senao
           retorne (taxa / total) * 100
      fimse
fimfuncao


procedimento BuscarCod (cod: inteiro; tamanho: inteiro)
var
   encontrado: inteiro
inicio
      encontrado <- 0
      para i de 1 ate tamanho faca
           se (a[i].cod = cod) entao
              escreval("")
              escreval("cod:",a[i].cod,"  nome:",a[i].nome,"  idade:",a[i].idade,"  especialidade:",a[i].especialidade,"  prioridade:",a[i].prioridade,"  tempo:",a[i].temp)
              escreval("")
              encontrado <- 1
              interrompa
           fimse
      fimpara
      se (encontrado = 0) entao
         escreval("código não encontrado")
      fimse
fimprocedimento

procedimento ordenavetor (total: inteiro)
inicio

         para i de 1 ate total-1 faca
              para j de i+1 ate total faca
                   se (a[i].prioridade < a[j].prioridade) entao
                      aux <- a[i]
                      a[i] <- a[j]
                      a[j] <- aux
                   senao
                   se (a[i].temp < a[j].temp) e (a[i].prioridade = a[j].prioridade) entao
                      aux <- a[i]
                      a[i] <- a[j]
                      a[j] <- aux
                   fimse
                   fimse
              fimpara
         fimpara


fimprocedimento
   
inicio
      somatemp <- 0
      countalta <- 0
      idosos <- 0
      atendimentos <- 3
      idoso1 <- 0
      idoso2 <- 0
      idoso3 <- 0


      para i de 1 ate atendimentos faca
           escreva("código do atendimento ",i,":")
           leia(a[i].cod)
           escreva("nome do atendimento ",i,":")
           leia(a[i].nome)
           escreva("idade do atendimento ",i,":")
           leia(a[i].idade)
           escreva("especialidade do atendimento ",i,":")
           leia(a[i].especialidade)
           escreva("prioridade do atendimento ",i," de 1 a 3:")
           leia(a[i].prioridade)
           escreva("tempo do atendimento ",i,":")
           leia(a[i].temp)
           
           enquanto (a[i].idade < 0) ou (a[i].prioridade < 1) ou (a[i].prioridade > 3) ou (a[i].temp <= 0) faca
                    escreval("Informações invalidas tente novamente")
                    escreva("código do atendimento ",i,":")
                    leia(a[i].cod)
                    escreva("nome do atendimento ",i,":")
                    leia(a[i].nome)
                    escreva("idade do atendimento ",i,":")
                    leia(a[i].idade)
                    escreva("especialidade do atendimento ",i,":")
                    leia(a[i].especialidade)
                    escreva("prioridade do atendimento ",i,":")
                    leia(a[i].prioridade)
                    escreva("tempo do atendimento ",i,":")
                    leia(a[i].temp)
           fimenquanto
           
           somatemp <- somatemp + a[i].temp


           se (a[i].prioridade = 3) entao
              countalta <- countalta + 1
           fimse
           
           se (i = 1) entao
              maiortempo <- a[i]
           senao
           se (maiortempo.temp < a[i].temp) entao
              maiortempo <- a[i]
           fimse
           fimse
           
           se (a[i].idade >= 60) entao
              idosos <- idosos + 1
           fimse
           
           se (a[i].idade >= 60) e (a[i].prioridade = 1) entao
              idoso1 <- idoso1 + 1
           senao
           se (a[i].idade >= 60) e (a[i].prioridade = 2) entao
              idoso2 <- idoso2 + 1
           senao
           se (a[i].idade >= 60) e (a[i].prioridade = 3) entao
              idoso3 <- idoso3 + 1
           fimse
           fimse
           fimse
      fimpara
      
      media <- calculaMedia(somatemp,atendimentos)
      porcentagemIdosos <- calculaPorcentagem(idosos,atendimentos)
      
      escreval("")
      escreval("------------------ESTATISTICAS-----------------")
      escreval("")
      escreval("quantidade de atendimentos de prioridade alta: ",countalta)
      escreval("Media do tempo dos atendimentos: ",media)
      escreval("paciente com maior tempo de atendimento:")
      escreval("cod:",maiortempo.cod,"  nome:",maiortempo.nome,"  idade:",maiortempo.idade,"  especialidade:",maiortempo.especialidade,"  prioridade:",maiortempo.prioridade,"  tempo:",maiortempo.temp)
      escreval("Porcentagem de idosos: ",porcentagemIdosos,"%")
      escreval("")
      
      
      escreval("")
      codbusca <- 1
      enquanto (codbusca <> 0) faca
               escreva("digite um codigo para buscar ou 0 para continuar")
               leia(codbusca)
               se (codbusca = 0) entao
                  interrompa
               fimse
               BuscarCod(codbusca, atendimentos)
      fimenquanto
      
      ordenavetor(atendimentos)
      escreval("")
      escreval("--------------------Vetor ordenado------------")
      para i de 1 ate atendimentos faca
           escreval(i,"º - cod:",a[i].cod,"  nome:",a[i].nome,"  idade:",a[i].idade,"  especialidade:",a[i].especialidade,"  prioridade:",a[i].prioridade,"  tempo:",a[i].temp)
      fimpara

      para i de 1 ate 3 faca
           final[i,1] <- i
      fimpara
      final[1,2] <- idoso1
      final[2,2] <- idoso2
      final[3,2] <- idoso3
      escreval("")
      para i de 1 ate 2 faca
           escreval("")
           para j de 1 ate 3 faca
                escreva(final[j,i])
           fimpara
      fimpara
      
      
      
fimalgoritmo
      

      