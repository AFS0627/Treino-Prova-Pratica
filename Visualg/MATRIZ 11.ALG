Algoritmo "matriz 11"

Var
matrizV: vetor [1..5,1..5] de inteiro
i, j, matrizN, multiplicador,maior,menor: inteiro
encontrado: logico


Inicio

     matrizN <- 5
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                escreva("numero para matriz:")
                leia(matrizV[i, j])
                se (i  = 1) e (j = 1) entao
                   menor <- matrizV[i, j]
                   maior <- matrizV[i, j]
                senao
                se (maior < matrizV[i, j]) entao
                   maior <- matrizV[i, j]
                se (menor > matrizV[i, j]) entao
                   menor <- matrizV[i, j]
                fimse
                fimse
                fimse
           fimpara
      fimpara

      


      para i de 1 ate matrizN faca
      escreval("")
           para j de 1 ate matrizN faca
                escreva("  ",matrizV[i,j])

           fimpara
      fimpara
      escreval("")
      escreval("Menor:",menor,"  maior:",maior)




Fimalgoritmo