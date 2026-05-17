Algoritmo "semnome"

tipo colaborador = registro
     nome: caractere
     notaProvaTeorica: real
     notaProvaPratica: real
     mediaPonderada: real
fimregistro

var
   colab: vetor [1..5] de colaborador
   i,n: inteiro
   maiorMediaFinal:colaborador


inicio
      n <- 5
      para i de 1 ate n faca
           escreval("Colaborador ",i)
           escreval("")
           escreva("nome do colaborador ",i,":")
           leia(colab[i].nome)
           escreva("nota da prova teorica do colaborador ",i,":")
           leia(colab[i].notaProvaTeorica)
           escreva("nota da prova pratica do colaborador ",i,":")
           leia(colab[i].notaProvaPratica)
           escreval("")
           
           colab[i].mediaPonderada <-  (colab[i].notaProvaTeorica * 4 + colab[i].notaProvaPratica * 6) / 10
           
           se (i = 1) entao
              maiorMediaFinal <- colab[i]
           senao
           se (colab[i].mediaPonderada > maiorMediaFinal.mediaPonderada) entao
              maiorMediaFinal <- colab[i]
           fimse
           fimse
           
      fimpara
      

      escreval("")
      escreval("------------Todos os colaboradores-----------------")

      para i de 1 ate n faca
           escreval("")
           se (colab[i].mediaPonderada >= 7.0) entao
              escreval("nome: ",colab[i].nome,"  media ponderada: ",colab[i].mediaPonderada,"  situação: Aprovado")
           senao
           se (colab[i].mediaPonderada < 7.0) e (colab[i].mediaPonderada >= 5) entao
              escreval("nome: ",colab[i].nome,"  media ponderada: ",colab[i].mediaPonderada,"  situação: Recuperação")
           senao

              escreval("nome: ",colab[i].nome,"  media ponderada: ",colab[i].mediaPonderada,"  situação: Reprovado")
           fimse
           fimse
fimpara
 escreval("")
      escreval("------------O grande destaque da capacitação foi:------------")
      escreval("nome: ",maiorMediaFinal.nome,"  media ponderada: ",maiorMediaFinal.mediaPonderada)
fimalgoritmo
           
           