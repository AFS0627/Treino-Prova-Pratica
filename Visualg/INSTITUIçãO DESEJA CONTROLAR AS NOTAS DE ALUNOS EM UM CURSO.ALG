Algoritmo "instituição deseja controlar as notas de alunos em um curso"

tipo aluno = registro
     matricula: inteiro
     nome: caractere
     nota1: real
     nota2: real
     nota3: real
     media: real
fimregistro

var
   a: vetor [1..5] de aluno
   i,j,countAprovados:inteiro
   aux:aluno
   soma,media,porcentagem: real
   
inicio
soma <- 0
      para i de 1 ate 5 faca
           escreva("matricula aluno:")
           leia(a[i].matricula)
           escreva("nome aluno:")
           leia(a[i].nome)
           escreva("nota 1 do aluno:")
           leia(a[i].nota1)
           escreva("nota 2 do aluno:")
           leia(a[i].nota2)

           escreva("nota 3 do aluno:")
           leia(a[i].nota3)
           escreval("")
           
           a[i].media <- (a[i].nota1 + a[i].nota2 + a[i].nota3) / 3
           
           soma <- soma + a[i].media
fimpara

       media <- soma / 5
       escreval("")
       para i de 1 ate 4 faca
            para j de i+1 ate 5 faca
                 se (a[i].media < a[j].media) entao
                    aux <- a[i]
                    a[i] <- a[j]
                    a[j] <- aux
                 fimse
            fimpara
       fimpara
          countAprovados <- 0
       escreval("----------Classificação dos alunos---------")
       escreval("")
       para i de 1 ate 5 faca
            se (a[i].media >= 7) e (i = 1) entao
                  escreval(i,"º- matricula: ",a[i].matricula,"   nome: ",a[i].nome,"   media: ",a[i].media,"  <- APROVADO  MAIOR MEDIA")
                  countAprovados <- countAprovados + 1
            senao
            se (a[i].media >= 7) entao
               escreval(i,"º- matricula: ",a[i].matricula,"   nome: ",a[i].nome,"   media: ",a[i].media,"  <- APROVADO")
               countAprovados <- countAprovados + 1
            senao
            se (a[i].media < 7) e (a[i].media >= 5) entao
               escreval(i,"º- matricula: ",a[i].matricula,"   nome: ",a[i].nome,"   media: ",a[i].media,"  <- RECUPERACAO")
            senao
                 escreval(i,"º- matricula: ",a[i].matricula,"   nome: ",a[i].nome,"   media: ",a[i].media,"  <- REPROVADO")
           fimse
           fimse
           fimse
       fimpara
       porcentagem <- (countAprovados/5) * 100
       escreval("")
       escreval("media da turma:",media)
       escreval("porcentagem de alunos aprovados:",porcentagem,"%")
fimalgoritmo
           

       



      



      
           
