algoritmo "gemini"

tipo vendedor = registro
     nome: caractere
     totalVendas: real
     comissao: real
fimregistro

var
   v: vetor [1..5] de vendedor
   i, maiorI: inteiro
   maior,soma,media: real

inicio
      soma <- 0
      
      para i de 1 ate 5 faca
           escreva("nome:")
           leia(v[i].nome)
           escreva("total vendas:")
           leia(v[i].totalVendas)
           
           se (v[i].totalVendas > 10000) entao
              v[i].comissao <- v[i].totalVendas * 0.10
           senao
                v[i].comissao <- v[i].totalVendas * 0.05
           fimse
           soma <- v[i].totalVendas + soma
           
           se (i = 1) entao
              maior <- v[i].totalVendas
              maiorI <- i
           senao
           se (v[i].totalVendas > maior) entao
              maior <- v[i].totalVendas
              maiorI <- i
           fimse
           fimse
           
      fimpara
      media <- soma / 5
      
      escreval("")
      escreval("--------------Vendedor com maior venda--------------------")
      escreval("nome:",v[maiorI].nome,"  totalVendas:",v[maiorI].totalVendas,"  comissão:",v[maiorI].comissao)
      escreval("")
      escreval("media das vendas:",media)
fimalgoritmo
           
      
      
      

           
           
           
           
   
   