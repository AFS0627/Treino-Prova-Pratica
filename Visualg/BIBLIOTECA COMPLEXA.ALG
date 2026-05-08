Algoritmo "Biblioteca complexa"

tipo emprestimo = registro
   cod: inteiro
   nomeA: caractere
   nomeL: caractere
   qntdDias: inteiro
   qntdPag: inteiro
   cursoA: caractere
   status: caracter
fimregistro

var
   em: vetor [1..20] de emprestimo
   i,j,n,qntdatrasado,somapag,fim,tamanhoTexto,totalVogais,countA,maiorNome: inteiro
   maiorQntdDiaEmprestado: emprestimo
   percentual, media: real
   nomeinvertido,letra,buscar: caractere


funcao calculaPercentual (qntd: inteiro; total: inteiro): real
inicio
   retorne (qntd / total) * 100
fimfuncao

funcao calculaMedia (soma: inteiro; total:inteiro): real
inicio
   retorne soma / total
fimfuncao

procedimento buscaLinear(nomeLivro: caractere)
var

   countEncotrado: inteiro
inicio

      countEncotrado <- 0
      para i de 1 ate n faca
           se (nomeLivro = em[i].nomeL) entao
              escreval("cod:",em[i].cod,"  nome aluno:",em[i].nomeA,"  Nome livro:",em[i].nomeL,"  quantidade de dias do emprestimo:",em[i].qntdDias,"  numero de paginas:",em[i].qntdPag,"  curso do aluno:",em[i].cursoA,"  status:",em[i].status)
              countEncotrado <- countEncotrado + 1
           fimse
      fimpara
      
      se (countEncotrado = 0) entao
         escreval("Nome de livro não encontrado")
      senao
           escreval("foram encontrados",countEncotrado," livros")
      fimse
fimprocedimento

procedimento ordenarRegistroEmprestimo()
var
   aux: emprestimo
inicio
      para i de 1 ate n-1 faca
           para j de i+1 ate n faca
                se (em[i].status = "E") e (em[j].status = "A") entao
                   aux <- em[i]
                   em[i] <- em[j]
                   em[j] <- aux
                senao
                se (em[i].status = em[j].status) e (em[i].qntdPag < em[j].qntdPag) entao
                   aux <- em[i]
                   em[i] <- em[j]
                   em[j] <- aux
                fimse
                fimse
           fimpara
      fimpara
fimprocedimento
              

inicio

   fim <- 1
   qntdatrasado <- 0
   somapag <- 0
   escreva("quantos emprestimos voce deseja cadastrar?:")
   leia(n)
   enquanto (n < 1) ou (n > 20) faca
      escreva("precisa ser um numero de 1 a 20")
      leia(n)
   fimenquanto

   para i de 1 ate n faca
      escreva("cod do emprestimo:")
      leia(em[i].cod)
      escreva("nome do aluno do emprestimo:")
      leia(em[i].nomeA)
      escreva("nome do livro do emprestimo:")
      leia(em[i].nomeL)
      escreva("quantidade de dias do emprestimo:")
      leia(em[i].qntdDias)
      escreva("quantidade paginas do livro do emprestimo:")
      leia(em[i].qntdPag)
      escreva("curso do aluno do emprestimo:")
      leia(em[i].cursoA)
      escreva("status do emprestimo:")
      leia(em[i].status)

      enquanto (em[i].qntdDias <= 0) ou (em[i].qntdPag <= 0) ou ((em[i].status <> "A") e (em[i].status <> "E")) faca
         escreval("Dados invalidos por favor digite novamente")
         escreva("cod do emprestimo:")
         leia(em[i].cod)
         escreva("nome do aluno do emprestimo:")
         leia(em[i].nomeA)
         escreva("nome do livro do emprestimo:")
         leia(em[i].nomeL)
         escreva("quantidade de dias do emprestimo:")
         leia(em[i].qntdDias)
         escreva("quantidade paginas do livro do emprestimo:")
         leia(em[i].qntdPag)
         escreva("curso do aluno do emprestimo:")
         leia(em[i].cursoA)
         escreva("status do emprestimo:")
         leia(em[i].status)
      fimenquanto

      somapag <- somapag + em[i].qntdPag

      se (em[i].status = "A") entao
         qntdatrasado <- qntdatrasado + 1
      fimse

      se (i = 1) entao
         maiorQntdDiaEmprestado <- em[i]
      senao
         se (em[i].qntdDias > maiorQntdDiaEmprestado.qntdDias) entao
            maiorQntdDiaEmprestado <- em[i]
         fimse
      fimse

   fimpara

   percentual <- calculaPercentual(qntdatrasado, n)
   media <- calculaMedia(somapag,n)

   escreval("")
   escreval("-----------------Quantidade de livros atrasados--------------")
   escreval(qntdatrasado)
   escreval("")
   escreval("-----------------Media de paginas dos livros-----------------")
   escreval(media)
   escreval("")
   escreval("-----------------Maior quantidade de dias emprestado---------")
   escreval("cod:",maiorQntdDiaEmprestado.cod,"  nome aluno:",maiorQntdDiaEmprestado.nomeA,"  Nome livro:",maiorQntdDiaEmprestado.nomeL,"  quantidade de dias do emprestimo:",maiorQntdDiaEmprestado.qntdDias,"  numero de paginas:",maiorQntdDiaEmprestado.qntdPag,"  curso do aluno:",maiorQntdDiaEmprestado.cursoA,"  status:",maiorQntdDiaEmprestado.status)
   escreval("")
   escreval("-----------------Percentual de livros atrasados--------------")
   escreval(percentual,"%")
   escreval("")

   escreval("-----------------nomes invertidos----------------------------")
   para i de 1 ate n faca
      nomeinvertido <- ""
      tamanhoTexto <- compr(em[i].nomeA)

      para j de tamanhoTexto ate 1 passo -1 faca
         nomeinvertido <- nomeinvertido + copia(em[i].nomeA, j, 1)
      fimpara
      escreval(i,") ",nomeinvertido)
   fimpara

   escreval("-----------------Total vogais de cada nome----------------------------")

   para i de 1 ate n faca
      totalVogais <- 0
      tamanhoTexto <- compr(em[i].nomeA)

      para j de 1 ate tamanhoTexto faca
         letra <- maiusc(copia(em[i].nomeA,j,1))
         se (letra = "A") ou (letra = "E") ou (letra = "I") ou (letra = "O") ou (letra = "U") entao
            totalVogais <- totalVogais + 1
         fimse
      fimpara

      escreval(i,") ",totalVogais," vogais")
   fimpara

   escreval("-----------------Livros que começam com a letra A----------------------------")
   countA <- 0
   para i de 1 ate n faca

      se (maiusc(copia(em[i].nomeL,1,1)) = "A") entao
         countA <- countA + 1
      fimse
   fimpara
   escreval(countA," livros")
   escreval("-----------------maior nome de livro em quantidade de caracteres----------------------------")

   para i de 1 ate n faca
        se (i = 1) entao
           maiorNome <- compr(em[i].nomeL)
        senao
        se ( compr(em[i].nomeL) > maiorNome) entao
           maiorNome <- compr(em[i].nomeL)
        fimse
        fimse
   fimpara
   escreval(maiorNome)
   
   escreval("")
   enquanto (buscar <> "0") faca
            escreva("Digite um nome de livro para buscar ou 0 para continuar:")
            leia(buscar)
            se (buscar = "0") entao
               interrompa
            fimse
            buscaLinear(buscar)
   fimenquanto
   
   escreval("")
   escreval("------------------ordenados--------------")
   ordenarRegistroEmprestimo
   para i de 1 ate n faca
        escreval(i,"º - cod:",em[i].cod,"  nome aluno:",em[i].nomeA,"  Nome livro:",em[i].nomeL,"  quantidade de dias do emprestimo:",em[i].qntdDias,"  numero de paginas:",em[i].qntdPag,"  curso do aluno:",em[i].cursoA,"  status:",em[i].status)
   fimpara
   
fimalgoritmo










