Algoritmo "Algoritmo de Busca e Mutação de Estado"

tipo maquina = registro
     ip: caractere
     setor: caractere
     bloqueada: logico
fimregistro

var
   maq: vetor[1..4] de maquina
   i,n,iBloq: inteiro
   ipBusca: caractere
   
   
   
funcao BuscarIp(ipAlvo: caractere):inteiro
var
   encontrado:inteiro
inicio
      encontrado <- 0
      para i de 1 ate 4 faca
           se(ipAlvo = maq[i].ip) entao
                     encontrado <- 1
                     retorne i

           fimse
      fimpara
      se encontrado = 0 entao
         retorne 0
      fimse
fimfuncao

inicio
      para i de 1 ate 4 faca
           escreva("ip da maquina ",i,":")
           leia(maq[i].ip)
           escreva("setor da maquina ",i,":")
           leia(maq[i].setor)
           maq[i].bloqueada <- falso
           escreval("")
      fimpara

      escreva("digite o ip que deseja bloquear: ")
      leia(ipBusca)
      iBloq <- BuscarIp(ipBusca)
      se (iBloq <> 0) entao
         maq[iBloq].bloqueada <- verdadeiro
         escreval("Ameaça contida: IP bloqueado com sucesso")
      senao
           escreval("Erro: IP não localizado na rede")
      fimse
      
      escreval("")
      escreval("----------Maquinas bloqueadas-----------")
      escreval("")
      
      para i de 1 ate 4 faca
           se (maq[i].bloqueada = verdadeiro) entao
              escreva(i,"- ip: ",maq[i].ip,"  setor: ",maq[i].setor)
           fimse
      fimpara
fimalgoritmo
      
           
