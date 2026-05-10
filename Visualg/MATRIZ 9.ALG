Algoritmo "matriz 9"

Var
matrizV: vetor [1..4,1..4] de inteiro
i, j, matrizN, multiplicador: inteiro
encontrado: logico


Inicio

     matrizN <- 2
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                escreva("numero para matriz:")
                leia(matrizV[j,i])
           fimpara
      fimpara

      escreva("numero para multiplicar na matriz: ")
      leia(multiplicador)
      
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                matrizV[j,i] <- matrizV[j,i] * multiplicador

           fimpara
      fimpara

      para i de 1 ate matrizN faca
      escreval("")
           para j de 1 ate matrizN faca
                escreva("  ",matrizV[j,i])

           fimpara
      fimpara




Fimalgoritmo