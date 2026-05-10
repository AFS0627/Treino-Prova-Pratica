Algoritmo "matriz 2"

Var
matrizV: vetor [1..4,1..4] de inteiro
maior, i, j: inteiro


Inicio

para i de 1 ate 4 faca
     para j de 1 ate 4 faca
          escreva("numero para a matriz")
          leia(matrizV[j,i])
          se (i = 1) e (j = 1) entao
          maior <- matrizV[j,i]
          senao
          se (matrizV[j,i] > maior) entao
             maior <- matrizV[j,i]
          fimse
          fimse
     fimpara
fimpara

para i de 1 ate 4 faca
     escreval("")
     para j de 1 ate 4 faca
          escreva("  ",matrizV[j,i])
     fimpara
fimpara
escreval("")
escreva ("maior:",maior)




Fimalgoritmo