Algoritmo "simulado 1 calculo de ipva"

tipo veiculo = registro
     nome: caractere
     valor: real
fimregistro

var
v: veiculo
ipva,ipvaDesconto,valorParcela:real

inicio
      escreva("Nome do veiculo:")
      leia(v.nome)
      escreva("valor do veiculo:")
      leia(v.valor)
      
      ipva <- v.valor * 0.04
      ipvaDesconto <- ipva - (ipva * 0.09)
      valorParcela <- ipva / 5
      
      escreval("")
      escreval("nome: ",v.nome)
      escreva("ipva: ",ipva,"  com desconto: ",ipvaDesconto,"  valor parcela: ",valorParcela)
fimalgoritmo
      



      
           
