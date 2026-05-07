// Cenário:
// O município está processando o resultado
// de um processo seletivo simplificado

// Requisitos

// Estrutura de Dados
// Criar um registro chamado Candidato contendo:
// Nome (texto)
// NotaTeorica (real)
// NotaPratica (real)
// Idade (inteiro)

// Entrada e Processamento
// Declarar um vetor para 5 candidatos
// Ler os dados
// Calcular a Nota Final
// Nota Final = NotaTeorica + NotaPratica

// Ordenação com Desempate
// Ordenar o vetor pela Nota Final
// em ordem decrescente

// Regra de Desempate
// Se dois candidatos tiverem a mesma Nota Final,
// o candidato com maior idade fica na frente

// Saída
// Imprimir apenas os candidatos aprovados
// Aprovado = Nota Final maior ou igual a 6.0

algoritmo "Processo seletivo"

tipo candidato = registro
     nome: caractere
     notaTeorica: real
     notaPratica: real
     Idade: inteiro
     notaFinal: real
fimregistro

var
   c: vetor [1..5] de candidato
   i, j: inteiro
   aux: candidato

inicio
      para i de 1 ate 5 faca
           escreva("nome do candidato ",i,":")
           leia(c[i].nome)
           escreva("nota Teorica do candidato ",i,":")
           leia(c[i].notaTeorica)
           escreva("nota Pratica do candidato ",i,":")
           leia(c[i].notaPratica)
           escreva("Idade do candidato ",i,":")
           leia(c[i].Idade)
           
           c[i].notaFinal <- c[i].notaTeorica + c[i].notaPratica
           
      fimpara
      
      para i de 1 ate 4 faca
           para j de i+1 ate 5 faca
                se (c[i].notaFinal < c[j].notaFinal) entao
                   aux <- c[i]
                   c[i] <- c[j]
                   c[j] <- aux
                senao
                se (c[i].notaFinal = c[j].notaFinal) e (c[i].idade < c[j].idade) entao
                   aux <- c[i]
                   c[i] <- c[j]
                   c[j] <- aux
                fimse
                fimse
           fimpara
      fimpara

      escreval("")
      escreval("---------------Candidatos aprovados-----------------")
      escreval("")
      para i de 1 ate 5 faca
           se (c[i].notaFinal < 6) entao
              interrompa
           fimse
           escreval(i,"º - nome:",c[i].nome,"  idade:",c[i].idade,"  Nota teorica:",c[i].notaTeorica,"  nota pratica:",c[i].notaPratica,"  nota final:",c[i].notaFinal)
      fimpara
fimalgoritmo