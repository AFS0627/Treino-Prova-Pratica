algoritmo "gemini2"

tipo veiculo = registro
     placa: caractere
     modelo: caractere
     ano: inteiro
     km: real
fimregistro

var
   i, j, maiorI: inteiro
   v: vetor [1..5] de veiculo
   aux: veiculo
   maiorVeiculo: veiculo

inicio

   para i de 1 ate 5 faca
        escreva("placa veiculo ",i,":")
        leia (v[i].placa)
        escreva("modelo veiculo ",i,":")
        leia (v[i].modelo)
        escreva("ano veiculo ",i,":")
        leia (v[i].ano)
        escreva("km veiculo ",i,":")
        leia (v[i].km)
        
        se (i = 1) entao
           maiorVeiculo <- v[i]
        senao
        se (v[i].km > maiorVeiculo.km) entao
           maiorVeiculo <- v[i]
        fimse
        fimse
        
   fimpara
   
   para i de 1 ate 4 faca
        para j de i+1 ate 5 faca
             se (v[i].ano < v[j].ano) entao
                aux <- v[i]
                v[i] <- v[j]
                v[j] <- aux
             fimse
        fimpara
   fimpara
   
   escreval("")
   escreval("------------ Carro com maior KM ---------------")
   escreval("placa:",maiorVeiculo.placa,"  modelo:",maiorVeiculo.modelo,"  ano:",maiorVeiculo.ano,"  km:",maiorVeiculo.km)
   escreval("")
   escreval("------------ Carros ordenados -----------------")
   escreval("")
   para i de 1 ate 5 faca
        escreval("placa:",v[i].placa,"  modelo:",v[i].modelo,"  ano:",v[i].ano,"  km:",v[i].km)
   fimpara
   
fimalgoritmo

           

           
           
           
           
   
   