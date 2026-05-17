Algoritmo "estoque de produtos e vendas"

tipo produto = registro
     cod: inteiro
     nome: inteiro
     preco: real
     qntdEstoque: inteiro
fimregistro

var
   p: vetor [1..10] de produto
   i,j,n,opcao: inteiro
   
   
procedimento registrarProdutos(n:inteiro)
inicio
      para i de 1 ate n faca
           escreva("----------------dados do produto ",i," --------------------")
           escreval("")
           escreva("cod do produto ",i,":")
           leia(p[i].cod)
           escreva("nome do produto ",i,":")
           leia(p[i].nome)
           escreva("preco do produto ",i,":")
           leia(p[i].preco)
           escreva("quantidade de estoque do produto ",i,":")
           leia(p[i].qntdEstoque)
           enquanto (p[i].qntdEstoque < 0) faca
                escreva("quantidade de estoque do produto ",i," precisa ser maior que 0:")
                leia(p[i].qntdEstoque)
           fimenquanto
           escreval("")
      fimpara
fimprocedimento

procedimento Buscarproduto(n:inteiro)
var
   encontrado: inteiro
   cod: inteiro
inicio
      encontrado <- 0
      escreval("digite o codigo para ser encontrado:")
      leia (cod)
      para i de 1 ate n faca
           se (cod = p[i].cod) entao
              escreval("")
              escreval("codigo produto: ",p[i].cod)
              escreval("nome produto: ",p[i].nome)
              escreval ("preço produto: ",p[i].preco)
              escreval("qntd do estoque do produto: ",p[i].qntdEstoque)

              
              escreval("")
              encontrado <- encontrado + 1
           fimse
      fimpara
      se (encontrado = 0) entao
         escreval("não foram encontrados produtos com esse codigo")
      senao
           escreval("foram encontrados ",encontrado," produtos com esse codigo")
      fimse
fimprocedimento

procedimento venderProduto(n:inteiro)
var
cod,qntd,feito: inteiro
inicio
      escreval("digite o cod do produto a ser vendido: ")
      leia(cod)
      escreval("digite a quantidade a ser vendida: ")
      leia(qntd)
      feito <- 0
      para i de 1 ate n faca
           se (p[i].cod = cod) e (p[i].qntdEstoque > qntd) entao
              p[i].qntdEstoque <- p[i].qntdEstoque - qntd
              escreval("produto vendido com sucesso quantidade atual é ",p[i].qntdEstoque)
              feito <- 1
           fimse
      fimpara
      se (feito = 0) entao
         escreval("nada foi feito")
      fimse
fimprocedimento


   
inicio

      opcao <- 1
      enquanto (opcao <> 0) faca
               escreva("----------MENU DE OPÇÕES--------------")
               escreval("")
               escreval("1- cadastrar produtos")
               escreval("2- vender produtos")
               escreval("3- buscar produto")
               escreval("0- sair")
               leia(opcao)
               se (opcao = 0) entao
                  interrompa
               fimse

               escolha(opcao)
               caso 1
                    escreva("quantos produtos cadastrar:")
                    leia(n)
                    enquanto (n < 1) ou (n > 10) faca
                    escreva("precisa ser de 1 a 10")
                    fimenquanto
                    registrarProdutos(n)

               interrompa
               
               caso 2
               venderProduto(n)
                 Buscarproduto(n)
                 interrompa
               caso 3
                 Buscarproduto(n)
                 interrompa
               fimescolha

fimenquanto
fimalgoritmo
      
      
      
