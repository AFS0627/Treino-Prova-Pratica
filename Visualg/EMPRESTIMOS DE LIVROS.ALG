Algoritmo "emprestimos de livros"

tipo emprestimo = registro
     numero: inteiro
     nome_aluno: caractere
     qntd_livros: inteiro
     status: caractere
fimregistro

var
   em: vetor[1..15] de emprestimo
   n,j,i,qntdPar,qntdImpar,busca,qntdTotalLivrosEmprestado,encontrado,qntdAtrasados: inteiro
   maiorQntdLivros,aux: emprestimo

   
inicio

      qntdPar <- 0
      qntdImpar <- 0
      busca <- 1
      qntdTotalLivrosEmprestado <- 0
      qntdAtrasados <- 0
      escreval("quantidade de emprestimos para cadastrar:")
      leia(n)
      
      enquanto (n < 1) ou (n > 15) faca
               escreva("quantidade de emprestimos precisa ser de 1 a 15")
               leia(n)
      fimenquanto
      
      para i de 1 ate n faca
           escreval("")
           escreva("numero do emprestimo:")
           leia(em[i].numero)
           escreva("nome_aluno do emprestimo:")
           leia(em[i].nome_aluno)
           escreva("qntd_livros do emprestimo:")
           leia(em[i].qntd_livros)
           escreva("status do emprestimo:")
           leia(em[i].status)
           
           se (em[i].status = "atrasado") entao
              qntdAtrasados <- qntdAtrasados + 1
           fimse
           
           se (i = 1) entao
              maiorQntdLivros <- em[i]
           senao
           se (em[i].qntd_livros > maiorQntdLivros.qntd_livros) entao
              maiorQntdLivros <- em[i]
           fimse
           fimse
           
           qntdTotalLivrosEmprestado <- qntdTotalLivrosEmprestado + em[i].qntd_livros
      fimpara
      para i de 1 ate n-1 faca
           para j de i+1 ate n faca
                se (em[i].nome_aluno > em[j].nome_aluno) entao
                   aux <- em[i]
                   em[i] <- em[j]
                   em[j] <- aux
                fimse
           fimpara
      fimpara
      
      escreval("")
      escreva("-------------todos os emprestimos-----------")
      escreval("")
      
      para i de 1 ate n faca
           escreval("numero: ",em[i].numero,"   nome aluno: ",em[i].nome_aluno,"   quantidade de livros: ",em[i].qntd_livros,"   status: ",em[i].status)
      fimpara
      
      escreval("")
      escreval("Quantidade total de livros emprestados: ",qntdTotalLivrosEmprestado)
      escreval("")
      escreval("Quantidade de emprestimos atrasados: ",qntdAtrasados)
      escreval("")
      escreval("--------------emprestimos com numero par--------------")
      escreval("")

      para i de 1 ate n faca
           se (em[i].numero % 2 = 0) entao
              escreval("numero: ",em[i].numero,"   nome aluno: ",em[i].nome_aluno,"   quantidade de livros: ",em[i].qntd_livros,"   status: ",em[i].status)
              fimse
      fimpara
      
      escreval("")
      escreval("--------------emprestimos com numero impares--------------")
      escreval("")
           
       para i de 1 ate n faca
           se (em[i].numero % 2 <> 0) entao
              escreval("numero: ",em[i].numero,"   nome aluno: ",em[i].nome_aluno,"   quantidade de livros: ",em[i].qntd_livros,"   status: ",em[i].status)
              fimse
      fimpara
      
      escreval("")
      escreval("--------------emprestimo com maior quantidade de livros--------------")
      escreval("")
      escreval("numero: ",maiorQntdLivros.numero,"   nome aluno: ",maiorQntdLivros.nome_aluno,"   quantidade de livros: ",maiorQntdLivros.qntd_livros,"   status: ",maiorQntdLivros.status)
      escreval("")
      
      enquanto (busca <> 0) faca
               escreva("digite o numero do livro para buscar ou 0 para encerrar:")
               leia(busca)

               se (busca = 0) entao
                  interrompa
               fimse
               encontrado <- 0
               para i de 1 ate n faca
                    se (em[i].numero = busca) entao
                        escreval("numero: ",em[i].numero,"   nome aluno: ",em[i].nome_aluno,"   quantidade de livros: ",em[i].qntd_livros,"   status: ",em[i].status)
                        encontrado <- encontrado + 1
                    fimse
               fimpara
               
               se (encontrado = 0) entao
                  escreval("não foram encontrados emprestimos com esse codigo")
               senao
                    escreval("foram encontrados ",encontrado," emprestimos com esse numero")
               fimse

               fimenquanto
fimalgoritmo
