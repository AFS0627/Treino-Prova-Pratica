Algoritmo "matriz 6"

Var
matrizV: vetor [1..4,1..4] de inteiro
i, j, matrizN,soma1,soma2,soma3: inteiro


Inicio
      soma1 <- 0
      soma2 <- 0
      soma3 <- 0
     matrizN <- 3
      para i de 1 ate matrizN faca
           para j de 1 ate matrizN faca
                escreva("numero para matriz:")
                leia(matrizV[j,i])
           fimpara
      fimpara
      
      para i de 1 ate matrizN faca
      soma1 <- soma1 + matrizV[i,1]
      soma2 <- soma2 + matrizV[i,2]
      soma3 <- soma3 + matrizV[i,3]
      fimpara
      escreval("   ",soma1)
      escreval("   ",soma2)
      escreval("   ",soma3)





Fimalgoritmo