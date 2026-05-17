Algoritmo "estoque de vacinas"

tipo vacina = registro
     nome: caractere
     qntdEstoque: inteiro
fimregistro

var
   vac: vetor [1..5] de vacina
   i,n: inteiro
   soma,media: real
   
funcao calculaMedia(soma:real;total:inteiro):real
inicio
      se (total <> 0) entao
         retorne soma / total
      senao
           retorne 0
      fimse
fimfuncao

inicio
      n <- 5
      soma <- 0
      para i de 1 ate n faca
           escreva("nome da vacina ",i,":")
           leia(vac[i].nome)
           escreva("quantidade em estoque da vacina ",i,":")
           leia(vac[i].qntdEstoque)
           escreval("")

           soma <- soma + vac[i].qntdEstoque
           se vac[i].qntdEstoque < 100 entao
              escreval("ALERTA: Estoque Critico")
              escreval("") // pula uma linha
           senao
                escreval("Estoque regular")
                escreval("")
           fimse
      fimpara
      
      media <- calculaMedia(soma,n)
      escreval("")
      escreva("media geral do estoque: ",media)
fimalgoritmo
      
           
           

