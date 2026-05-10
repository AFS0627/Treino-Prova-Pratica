Algoritmo "emprestimo de equipamentos"


tipo
   equipamento = registro
      cod: inteiro
      nome: caractere
      tipoo: caractere
      status: caractere
fimregistro

      emprestimo_reg = registro
      codequipamento: inteiro
      data: caractere
      nomeSolicitante: caractere
   fimregistro

var
   em: vetor [1..3] de emprestimo_reg
   eq: vetor [1..3] de equipamento
   i,j,n,buscar,escolhaN: inteiro
   dataAtual, NomeSO: caractere


procedimento BuscarEquipamentoCod(codigo: inteiro)
var
   CountEncontrado: inteiro
inicio
      countEncontrado <- 0
      para i de 1 ate n faca
           se ( codigo = eq[i].cod) entao
              escreval("Cod: ",eq[i].cod,"  nome: ",eq[i].nome,"  tipo: ",eq[i].tipoo,"  status: ",eq[i].status)
              countEncontrado <- countEncontrado + 1
           fimse
      fimpara
      se (countEncontrado = 0) entao
         escreval("Nenhum equipamento com esse codigo foi encontrado!")
      senao
           escreval("Foram encontrados ",countEncontrado," equipamentos com esse codigo")
      fimse
fimprocedimento

procedimento listarEquipamentos()
inicio
escreval("")
      escreval("----------------Equipamentos--------------")
      para i de 1 ate n faca
           escreval("Cod: ",eq[i].cod,"  nome: ",eq[i].nome,"  tipo: ",eq[i].tipoo,"  status: ",eq[i].status)
      fimpara
fimprocedimento

procedimento emprestar (codE: inteiro ; nomeS:caractere)

inicio
      para i de 1 ate n faca
           se ( codE = eq[i].cod) entao
              se (eq[i].status = "D") entao
                 em[i].codequipamento <- eq[i].cod
                 em[i].data <- dataAtual
                 em[i].nomeSolicitante <- nomeS
                 eq[i].status <- "E"
                 escreval("Produto de codigo ",eq[i].cod," emprestado com sucesso")
              senao
                   escreval("O produto não está disponivel")
              fimse
              interrompa
           fimse
      fimpara
fimprocedimento

procedimento devolver (codEquipamento: inteiro)
inicio
       para i de 1 ate n faca
           se ( codEquipamento = em[i].codequipamento) entao
              se (eq[i].status = "E") entao
                 em[i].codequipamento <- 0
                 em[i].data <- ""
                 em[i].nomeSolicitante <- ""
                 eq[i].status <- "D"
                 escreval("Produto de codigo ",codEquipamento," devolvido com sucesso")
              senao
                   escreval("O produto não foi emprestado")
              fimse
              interrompa
           fimse
      fimpara
fimprocedimento

procedimento relatorio ()
inicio
      escreval("")
      escreval("----------------Equipamentos emprestados--------------")
      para i de 1 ate n faca
           se (eq[i].status = "E") entao
             escreval("Cod: ",eq[i].cod,"  nome: ",eq[i].nome,"  tipo: ",eq[i].tipoo,"  status: ",eq[i].status,"  Nome solicitante: ",em[i].nomeSolicitante,"  data: ",em[i].data)
           fimse
      fimpara
fimprocedimento



inicio
      dataAtual <- "09/05/2026"
      escreva("quantos equipamentos deseja cadastrar 1 a 3: ")
      leia(n)
      enquanto (n < 1) ou (n > 3) faca
               escreva("invalido! digite um numero de 1 a 3: ")
               leia(n)
      fimenquanto

      para i de 1 ate n faca
           escreva("cod equipamento ",i,":")
           leia(eq[i].cod)
           escreva("nome equipamento ",i,":")
           leia(eq[i].nome)
           escreva("tipo equipamento ",i,":")
           leia(eq[i].tipoo)

           eq[i].status <- "D"
     fimpara
     escolhaN <- 1
     enquanto (escolhaN <> 0) faca
     escreval("")
     escreva("o que você deseja fazer 1- listar equipamentos 2- procurar equipamento pelo codigo 3- cadastrar um emprestimo 4- devolver equipamento 5- realatorio de equipamentos emprestado no momento 0- sair: ")
     leia(escolhaN)
     se (escolhaN = 0) entao
        interrompa
     fimse
     enquanto (escolhaN < 0) ou (escolhaN > 5) faca
              escreval("invalido! precisa ser um numero 1, 2 ou 3: ")
              leia(escolhaN)
     fimenquanto

     escolha (escolhaN)
     caso 1
          listarEquipamentos

     caso 2
          buscar <- 1
          enquanto (buscar <> 0) faca
                   escreval("digite o codigo para buscar ou 0 para continuar: ")
                   leia(buscar)
                   se (buscar = 0) entao
                      interrompa
                   fimse
                   BuscarEquipamentoCod(buscar)
          fimenquanto

     caso 3
          buscar <- 1
          enquanto (buscar <> 0) faca
                   escreval("digite o codigo do produto para emprestar ou 0 para continuar: ")
                   leia(buscar)
                   se (buscar = 0) entao
                      interrompa
                   fimse
                   escreval("Nome do solicitante: ")
                   leia(nomeSO)
                   emprestar(buscar, nomeSO)
          fimenquanto
     caso 4
          buscar <- 1
          enquanto (buscar <> 0) faca
                   escreval("digite o codigo do produto para emprestar ou 0 para continuar: ")
                   leia(buscar)
                   se (buscar = 0) entao
                      interrompa
                   fimse

                   devolver(buscar)
          fimenquanto
     caso 5
          relatorio

     fimescolha
     fimenquanto


fimalgoritmo

