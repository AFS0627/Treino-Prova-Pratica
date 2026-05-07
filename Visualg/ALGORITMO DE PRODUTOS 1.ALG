// Cada produto possui:
// código (inteiro)
// nome (cadeia)
// quantidade (inteiro)
// preço (real)

// Requisitos

// Desenvolva um algoritmo que:

// 1) Estrutura de Dados
// Criar um registro chamado Produto
// Criar um vetor de 10 produtos

// 2) Entrada de Dados
// Ler os dados dos 10 produtos

// 3) Processamentos

// a) Maior valor em estoque
// Calcular qual produto possui o maior valor total
// Valor total = quantidade * preço
// Exibir nome e valor total

// b) Média de preços
// Calcular a média dos preços dos produtos

// c) Contador condicional
// Contar quantos produtos possuem quantidade menor que 5

// d) Busca
// Solicitar um código ao usuário
// Realizar busca linear
// Exibir os dados do produto, se encontrado

// e) Ordenação
// Ordenar o vetor por preço crescente usando Bubble Sort

// f) Modularização
// Criar pelo menos:
// 1 função para cálculo de média
// 1 procedimento para ordenação

// Saída esperada:
// Produto com maior valor total
// Média dos preços
// Quantidade de produtos com estoque baixo
// Resultado da busca
// Lista ordenada por preço

algoritmo "Algoritmo de produtos 1"


tipo produto = registro
     cod: inteiro
     nome: caractere
     qntd: inteiro
     preco: real
fimregistro

funcao CalculaMedia (soma: real; total: inteiro): real
inicio
      retorne soma / total
fimfuncao


var
   i, j, qntd5, n, encontrado: inteiro
   p: vetor [1..10] de produto
   soma, media: real
   maiorValor: produto
   aux: produto
   
inicio
      soma <- 0
      qntd5 <- 0
      para i de 1 ate 10 faca
           escreva("cod produto ",i,":")
           leia(p[i].cod)
           escreva("nome produto ",i,":")
           leia(p[i].nome)
           escreva("qntd produto ",i,":")
           leia(p[i].qntd)
           escreva("preco produto ",i,":")
           leia(p[i].preco)
           
           soma <- soma + p[i].preco
           
           se (i = 1) entao
              maiorValor <- p[i]
           senao
           se ((maiorValor.preco * maiorValor.qntd) < (p[i].preco * p[i].qntd)) entao
              maiorValor <- p[i]
           fimse
           fimse
           
           se (p[i].qntd < 5) entao
              qntd5 <- qntd5 + 1
           fimse
      fimpara
      
      para i de 1 ate 9 faca
           para j de i+1 ate 10 faca
                se (p[i].preco > p[j].preco) entao
                   aux <- p[i]
                   p[i] <- p[j]
                   p[j] <- aux
                fimse
           fimpara
      fimpara
      
      media <- CalculaMedia (soma, 10)
      
      escreval("")
      n <- 1
      enquanto (n <> 0) faca
               escreval("digite um código para pesquisar ou 0 para avançar:")
               leia(n)
               se (n = 0) entao
                  interrompa
               fimse
               encontrado <- 0
               para i de 1 ate 10 faca
                    se (p[i].cod = n) entao
                       encontrado <- 1
                       escreval("cod:",p[i].cod,"  nome:",p[i].nome,"  quantidade:",p[i].qntd,"  preco:",p[i].preco)
                       interrompa
                    fimse

               fimpara
               se (encontrado = 0) entao
                  escreval("codigo não encontrado")
               fimse
               
      fimenquanto
      
      escreval("")
      escreval("------------------- Produto com maior valor total -----------------")
      escreval("cod:",maiorValor.cod,"  nome:",maiorValor.nome,"  quantidade:",maiorValor.qntd,"  preco:",maiorValor.preco,"  valor total:R$", maiorValor.preco * maiorValor.qntd)
      escreval("")
      escreval("------------------- Produtos com estoque baixo -----------------")
      escreval(qntd5)
      escreval("")
      escreval("------------------- Média dos preços -----------------")
      escreval("Media:",media)
      escreval("------------------- Lista ordenada por preço -----------------")
      para i de 1 ate 10 faca
           escreval(i,"º - cod:",p[i].cod,"  nome:",p[i].nome,"  quantidade:",p[i].qntd,"  preco:",p[i].preco)
      fimpara
fimalgoritmo

      
           
           
           
           
           
           

           
           
           
           
   
   