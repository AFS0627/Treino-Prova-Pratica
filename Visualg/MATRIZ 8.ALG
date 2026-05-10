Algoritmo "matriz 8"

Var
matrizV: vetor [1..4,1..4] de inteiro
i, j, matrizN, busca: inteiro
encontrado: logico


Inicio

     matrizN <- 3
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                escreva("numero para matriz:")
                leia(matrizV[j,i])
           fimpara
      fimpara

      escreva("numero para buscar na matriz: ")
      leia(busca)
      
      encontrado <- falso
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                se (busca = matrizV[j,i]) entao
                   escreva("Numero encontrado")
                   encontrado <- verdadeiro
                   interrompa
                fimse
           fimpara
      fimpara
      se (encontrado = falso) entao
         escreva("Numero não encontrado")
      fimse
      




Fimalgoritmo