Algoritmo "algoritmo para controlar pedidos da loja"


tipo pedido = registro
     numero: inteiro
     nomeCliente: caractere
     valorTotal: real
     status: caractere
fimregistro

var
   n,i,j,qntdCancelados,busca,encontrado: inteiro
   p: vetor [1..20] de pedido
   valorTotal: real
   aux: pedido

inicio
      valorTotal <- 0
      qntdCancelados <- 0
      
      escreva("numero de pedidos para cadastrar:")
      leia(n)

      enquanto (n < 1) ou (n > 20) faca
             escreva("numero de pedidos para cadastrar precisa ser de 1 a 20:")
             leia(n)
      fimenquanto
      
      para i de 1 ate n faca
           escreval("")
           escreva("numero do pedido:")
           leia(p[i].numero)
           escreva("nome do cliente:")
           leia(p[i].nomeCliente)
           escreva("valorTotal:")
           leia(p[i].valorTotal)
           escreva("status:")
           leia(p[i].status)
           
           enquanto (p[i].status <> "ABERTO") e (p[i].status <> "PAGO") e (p[i].status <> "CANCELADO") faca
                    escreva("status invalido digite ABERTO ou PAGO ou CANCELADO")
                    leia(p[i].status)
           fimenquanto
           
           valorTotal <- p[i].valorTotal + valorTotal

           se (p[i].status = "CANCELADO") entao
              qntdCancelados <- qntdCancelados + 1
           fimse
           
fimpara

       para i de 1 ate n-1 faca
            para j de i+1 ate n faca
                 se (p[i].valorTotal < p[j].valorTotal) entao
                    aux <- p[i]
                    p[i] <- p[j]
                    p[j] <- aux
                 fimse
            fimpara
       fimpara

       escreval("")
       escreval("---------Pedidos Cadastrados---------")
       escreval("")
       para i de 1 ate n faca
            escreval("")
            escreval("numero: ",p[i].numero)
            escreval("nome do cliente: ",p[i].nomeCliente)
            escreval("valor total do pedido: ",p[i].valorTotal)
            escreval("status do pedido: ",p[i].status)
       fimpara
       
       escreval("")
       escreval("valor total em pedidos: ",valorTotal)
       escreval("")
       escreval("quantidade de pedidos cancelados: ",qntdCancelados)
       escreval("")

       escreval("---------Pedidos com numero par---------")
       escreval("")
       para i de 1 ate n faca
            se (p[i].numero % 2 = 0) entao
               escreval("")
               escreval("numero: ",p[i].numero)
               escreval("nome do cliente: ",p[i].nomeCliente)
               escreval("valor total do pedido: ",p[i].valorTotal)
               escreval("status do pedido: ",p[i].status)
            fimse
       fimpara
       escreval("")

       escreval("--------- 3 Pedidos com maior valor---------")
       escreval("")
       se (n>=3) entao
       para i de 1 ate 3 faca
               escreval("")
               escreval("numero: ",p[i].numero)
               escreval("nome do cliente: ",p[i].nomeCliente)
               escreval("valor total do pedido: ",p[i].valorTotal)
               escreval("status do pedido: ",p[i].status)

       fimpara
       senao
            escreval("não há 3 pedidos cadastrados")
       fimse
       

       escreval("")
       escreval("---------Pedidos com maior valor---------")
       escreval("")

               escreval("")
               escreval("numero: ",p[1].numero)
               escreval("nome do cliente: ",p[1].nomeCliente)
               escreval("valor total do pedido: ",p[1].valorTotal)
               escreval("status do pedido: ",p[1].status)
               
escreval("")
       escreval("---------Pedidos com menor valor---------")
       escreval("")

               escreval("")
               escreval("numero: ",p[n].numero)
               escreval("nome do cliente: ",p[n].nomeCliente)
               escreval("valor total do pedido: ",p[n].valorTotal)
               escreval("status do pedido: ",p[n].status)
               
               escreval("")
               busca <- 1
               enquanto (busca <> 0) faca
                        escreval("digite um numero para buscar ou 0 para encerrar:")
                        leia(busca)
                        
                        se (busca = 0) entao
                           interrompa
                        fimse
                        encontrado <- 0
                        para i de 1 ate n faca
                             se (busca = p[i].numero) entao
                              escreval("")
                              escreval("numero: ",p[i].numero)
                               escreval("nome do cliente: ",p[i].nomeCliente)
                                escreval("valor total do pedido: ",p[i].valorTotal)
                                escreval("status do pedido: ",p[i].status)
                               encontrado <- encontrado + 1
                              fimse
                        fimpara
                        se (encontrado = 0) entao
                           escreval("")
                           escreval("não foi encontrado pedido com esse numero")
                        senao
                             escreval("")
                             escreval("foram encontrados ",encontrado," pedidos com esse numero")
                        fimse
               fimenquanto
               fimalgoritmo
       
       