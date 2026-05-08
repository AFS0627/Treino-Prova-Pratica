Algoritmo "Matriz e cadeias"

tipo aluno = registro
     cod: inteiro
     nome: caractere
     media: real
     turma: caractere
fimregistro

var
   a: vetor[1..8] de aluno
   matrizestatistica: vetor[1..2,1..2] de inteiro
   aprovados: vetor [1..2] de inteiro
   reprovados: vetor [1..2] de inteiro
   i,j,aprovadostotal,indiceTurma,alunos,countTurmaA,countTurmaB: inteiro
   somaA,somaB: real
   maiorMedia: aluno
   busca1: caractere

funcao calculaMedia(soma:real; alunos:inteiro): real
inicio
      se (soma =0) ou (alunos = 0) entao
         retorne 0
      senao
           retorne soma / alunos
      fimse
fimfuncao


funcao contarVogal (nome: caractere): inteiro
var
   numeroVogais: inteiro
   letra: caractere
inicio
      numeroVogais <- 0
      letra <- ""
      para j de 1 ate compr(nome) faca
           letra <- maiusc(copia(nome, j, 1))
           se (letra = "A") ou (letra = "E") ou (letra = "I") ou (letra = "O") ou (letra = "U") entao
              numeroVogais <- numeroVogais + 1
           fimse
      fimpara
      retorne numeroVogais
fimfuncao

funcao textoInvertidoFunc(nome: caractere): caractere
var
   textoInvertido:caractere
   tamanhoTexto: inteiro
inicio
      tamanhoTexto <- compr(nome)
      textoInvertido <- ""
      para j de tamanhoTexto ate 1 passo -1 faca
           textoInvertido <- textoInvertido + copia(nome,j,1)
     fimpara
     retorne textoInvertido
     fimfuncao

procedimento ordenaAlunoAlfabeto()
var
aux: aluno
inicio
      para i de 1 ate alunos-1 faca
           para j de i+1 ate alunos faca
                se (maiusc(a[i].nome) > maiusc(a[j].nome)) entao
                   aux <- a[i]
                   a[i] <- a[j]
                   a[j] <- aux
                fimse
           fimpara
      fimpara
fimprocedimento

procedimento buscaLinearAluno(busca:caractere; total: inteiro)
var
   encontradoCount, i: inteiro
inicio
      encontradoCount <- 0
     para i de 1 ate total faca
          se (maiusc(a[i].nome) = maiusc(busca)) entao
             escreval("cod:",a[i].cod,"  nome:",a[i].nome,"  media:",a[i].media,"  turma:",a[i].turma)
             encontradoCount <- encontradoCount + 1
          fimse
     fimpara
     se (encontradoCount = 0) entao
     escreval("")
        escreval("não foram encontrados alunos com esse nome")
     senao
          escreval("")
          escreval("foram encontrados ",encontradoCount," alunos com esse nome")
     fimse
fimprocedimento

procedimento listarAlunos()
inicio
       para i de 1 ate alunos faca
            escreval("cod:",a[i].cod,"  nome:",a[i].nome,"  media:",a[i].media,"  turma:",a[i].turma)
      fimpara
fimprocedimento



inicio
      para i de 1 ate 2 faca
            aprovados[i] <- 0
            reprovados[i]  <- 0
      fimpara
      somaA <- 0
      somaB <- 0
      countTurmaA <- 0
      countTurmaB <- 0

      escreva("quantos alunos?: ")
      leia(alunos)
      enquanto (alunos < 1) ou (alunos > 8) faca
              escreva("quantos alunos? precisa ser de 1 a 8: ")
              leia(alunos)
      fimenquanto
      para i de 1 ate alunos faca
           escreva("cod do aluno",i,":")
           leia(a[i].cod)
           escreva("nome do aluno",i,":")
           leia(a[i].nome)
           escreva("media do aluno",i,":")
           leia(a[i].media)
           escreva("turma do aluno ",i," A ou B:")
           leia(a[i].turma)
           enquanto (a[i].turma <> "A") e (a[i].turma <> "B") faca
                    escreva("turma do aluno ",i," precisa ser A ou B:")
                    leia(a[i].turma)
           fimenquanto
           enquanto (a[i].media < 0) ou (a[i].media > 10) faca
                    escreva("media invalida digite novamente:")
                    leia(a[i].media)
           fimenquanto

           se (a[i].turma = "A") entao
              somaA <- somaA + a[i].media
              indiceTurma <- 1
              countTurmaA <- countTurmaA + 1
           senao
                somaB <- somaB + a[i].media
                indiceTurma <- 2
                countTurmaB <- countTurmaB + 1
           fimse

           se (a[i].media >= 7) entao
              aprovados[indiceTurma] <- aprovados[indiceTurma] + 1
           senao
              reprovados[indiceTurma] <- reprovados[indiceTurma] + 1
           fimse
           se (i = 1) entao
              maiorMedia <- a[i]
           senao
           se (a[i].media > maiorMedia.Media) entao
              maiorMedia <- a[i]
           fimse
           fimse
           fimpara
      aprovadosTotal <- aprovados[1] + aprovados[2]

      escreval("")
      escreval("------------Total aprovados-------------")
      escreval(aprovadosTotal)
      escreval("")
      escreval("------------media geral por turma-------------")
      escreval("Turma A: ",calculaMedia(somaA,countTurmaA))
      escreval("Turma B: ",calculaMedia(somaB,countTurmaB))
      escreval("")
      escreval("------------Aluno com maior media-------------")
      escreval("cod:",maiorMedia.cod,"  nome:",maiorMedia.nome,"  media:",maiorMedia.media,"  turma:",maiorMedia.turma)

      escreval("------------Nomes invertidos-------------")
      para i de 1 ate alunos faca

           escreval(textoInvertidoFunc(a[i].nome))
      fimpara

      escreval("")
      escreval("------------Contagem de vogais de cada aluno-------------")
      para i de 1 ate alunos faca
            escreval(i," - ",contarVogal(a[i].nome)," vogais")
      fimpara

      ordenaAlunoAlfabeto

      escreval("")
      escreval("------------Ordenado alfabeticamente-------------")
      listarAlunos

      busca1 <- ""
      enquanto (busca1 <> "0") faca
              escreval("")
              escreval("Digite o nome de um aluno para buscar ou 0 para avançar: ")
              leia(busca1)
              se (busca1 = "0") entao
                 interrompa
              fimse
              buscaLinearAluno(busca1,alunos)
      fimenquanto

      para i de 1 ate 2 faca
           matrizestatistica[i,1] <- aprovados[i]
           matrizestatistica[i,2] <- reprovados[i]
      fimpara
            escreval("Turma    Aprovados     Reprovados")
            escreva("  A")
      para i de 1 ate 2 faca

           escreva("             ",matrizestatistica[1,i])
      fimpara
      escreval("")
      escreva("  B")
      para i de 1 ate 2 faca

           escreva("             ",matrizestatistica[2,i])
      fimpara



fimalgoritmo