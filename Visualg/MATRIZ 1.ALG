Algoritmo "matriz 1"

Var
matrizV: vetor [1..3,1..3] de inteiro
soma, i, j: inteiro


Inicio
soma <- 0
para i de 1 ate 3 faca
     para j de 1 ate 3 faca
          escreva("numero para a matriz")
          leia(matrizV[j,i])
          soma <- soma + matrizV[j,i]
     fimpara
fimpara

para i de 1 ate 3 faca
     escreval("")
     para j de 1 ate 3 faca
          escreva("  ",matrizV[j,i])
     fimpara
fimpara
escreval("")
escreva ("soma:",soma)




Fimalgoritmo