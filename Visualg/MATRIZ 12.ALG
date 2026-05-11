Algoritmo "matriz 12"

Var
matrizV: vetor [1..5,1..5] de inteiro
i, j, matrizN, multiplicador,maior,menor,soma: inteiro
encontrado: logico


Inicio
      soma <- 0
     matrizN <- 4
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

       para i de 3 ate matrizN faca
            soma <- soma + matrizV[1, i]
       fimpara
       soma <- soma + matrizV[2,4 ]
       escreval(matrizV[2,4])

      para i de 1 ate matrizN faca
      escreval("")
           para j de 1 ate matrizN faca
                escreva("  ",matrizV[i,j])

           fimpara
      fimpara
      escreval("")
      escreval("Menor:",menor,"  maior:",maior)
      escreval("soma da diagonal principal",soma)




Fimalgoritmo