Algoritmo "matriz 3"

Var
matrizV: vetor [1..3,1..3] de inteiro
pares, i, j: inteiro


Inicio
pares <- 0
para i de 1 ate 3 faca
     para j de 1 ate 3 faca
          escreva("numero para a matriz")
          leia(matrizV[j,i])
          se matrizV[j,i] % 2 = 0 entao
          pares <- pares + 1


          fimse
     fimpara
fimpara

para i de 1 ate 3 faca
     escreval("")
     para j de 1 ate 3 faca
          escreva("  ",matrizV[j,i])
     fimpara
fimpara
escreval("")
escreva ("pares:",pares)




Fimalgoritmo