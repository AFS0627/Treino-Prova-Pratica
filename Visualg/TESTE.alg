Algoritmo "teste"

tipo paciente = registro
Cod_paciente,idade,tipo_atendimento:inteiro
 nome:caractere
fimregistro

Var
p: vetor [1..10] de paciente
i,n,totalConsultas,totalExames,totalRetornos,somaIdades,maiorIdade:inteiro
nomeMaisVelho:caractere


Inicio
totalConsultas <- 0
   totalExames <-0
totalRetornos <- 0
somaIdades <-0
maiorIdade <-0
escreva("numero de consultas (max 10): ")
leia(n)
enquanto (n<=0) ou (n>10) faca
escreva("maior que 0 e no maximo 10: ")
leia(n)
fimenquanto

se (n > 10) entao
n <-10
fimse
para i de 1 ate n faca
p[i].Cod_paciente <- i
escreva("nome paciente ",i,": ")
leia(p[i].nome)
escreva("idade do paciente ",i,": ")
leia(p[i].idade)
escreval("Tipo atendimento do paciente ",i,)
escreval(" 1 - Consulta")
escreval(" 2 - Exame")
escreval(" 3 - Retorno: ")
leia(p[i].tipo_atendimento)
escolha p[i].tipo_atendimento
caso 1
totalConsultas <- totalConsultas + 1
caso 2
totalExames <- totalExames + 1
caso 3
totalRetornos <- totalRetornos + 1
fimescolha
somaIdades <- somaIdades + p[i].idade
se p[i].idade > maiorIdade entao
maiorIdade <- p[i].idade
nomeMaisVelho <- p[i].nome
fimse
fimpara
escreval("total de atendimentos cadastrados: ",n)
escreval("Consultas: ",totalConsultas," exames: ",totalExames," Retornos: ",totalRetornos)
escreval("nome do mais velho: ",nomeMaisVelho)
escreval("media de idade: ",somaIdades/n)




Fimalgoritmo