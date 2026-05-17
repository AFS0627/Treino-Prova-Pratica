Algoritmo "consultas"

tipo consulta = registro
     numero: inteiro
     nome_paciente: caractere
     nome_medico: caractere
     valor: real
     status: caractere
fimregistro

var
   i,n,qntdCanceladas,busca: inteiro
   valorTotal: real
   c: vetor[1..10] de consulta


inicio
      valorTotal <- 0
      qntdCanceladas <- 0
      escreva("quantas consultas cadastrar?: ")
      leia(n)
      enquanto (n < 1) ou (n > 10) faca
               escreva("precisa ser entre 1 e 10")
               leia(n)
      fimenquanto
      
      para i de 1 ate n faca
           escreval("")
           escreva("numero consulta:")
           leia(c[i].numero)
           escreva("nome paciente:")
           leia(c[i].nome_paciente)
           escreva("nome_medico:")
           leia(c[i].nome_medico)
           escreva("valor:")
           leia(c[i].valor)
           escreva("status:")
           leia(c[i].status)
           
           enquanto (c[i].status <> "cancelada") e (c[i].status <> "andamento") e (c[i].status <> "realizada") faca
                    escreva("os status possiveis são cancelada,andamento ou realizada por favor digite novamente:")
                    leia(c[i].status)
           fimenquanto
           
           se (c[i].status = "realizada") entao
              valorTotal <- valorTotal + c[i].valor
           fimse
           
           se (c[i].status = "cancelada") entao
              qntdCanceladas <- qntdCanceladas + 1
           fimse
           
      fimpara
      escreval("")
      escreval("-------------todas as consultas------------")
      para i de 1 ate n faca
           escreval("")
           escreval("numero: ",c[i].numero,"  nome paciente: ",c[i].nome_paciente,"   nome medico: ",c[i].nome_medico,"  valor: ",c[i].valor,"  status: ",c[i].status)
           fimpara

      busca <- 1
      enquanto (busca <> 0) faca
               escreval("")
               escreva("numero da consulta para buscar ou 0 para sair:")
               escreval("")
               leia(busca)
               se (busca = 0) entao
                  interrompa
               fimse
               para i de 1 ate n faca
                    se (busca = c[i].numero) entao
                       escreval("numero: ",c[i].numero,"  nome paciente: ",c[i].nome_paciente,"   nome medico: ",c[i].nome_medico,"  valor: ",c[i].valor,"  status: ",c[i].status)
                       interrompa
                    fimse
               fimpara
               fimenquanto
               escreval("quantidade de canceladas:",qntdCanceladas)
               escreval("valor total das consultas realizadas:",valorTotal)
      fimalgoritmo