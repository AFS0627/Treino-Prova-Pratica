#include <stdio.h>

struct produto{
    int cod;
    char nome[15];
    float preco;
    int qntd;
};
void cadatraProdutos(struct produto p[], int n){
    for(int i = 0;i < n;i++){
        printf("cod produto %d: ",i+1);
        scanf("%d",&p[i].cod);
        printf("nome produto %d: ",i+1);
        scanf(" %[^\n]", p[i].nome);
        printf("preco produto %d: ",i+1);
        scanf("%f",&p[i].preco);
        printf("quantidade produto %d: ",i+1);
        scanf("%d",&p[i].qntd);
        while(p[i].qntd < 0){
           printf("quantidade produto %d precisa ser maior que 0: ",i+1);
        scanf("%d",&p[i].qntd); 
        }
    }
}
void pedido(struct produto p[],int n,int codBusca,int qntd){
    int encontrado = 0;
    for(int i =0;i<n;i++){
        if(codBusca == p[i].cod && qntd <= p[i].qntd){
            p[i].qntd = p[i].qntd - qntd;
            printf("\nPedido realizado com sucesso quantidade atual %d",p[i].qntd);
            encontrado = 1;
            break;
            
        }else if(codBusca == p[i].cod){
            encontrado = 1;
            printf("\nnão ha quantidade o suficiente para realizar o pedido quantidade atual e: %d",p[i].qntd);
            break;
        }
    }
    if(encontrado == 0){
        printf("\nCodigo não encontrado");
    }
}


int main(){
    int n = 5,busca,qntd;
    struct produto p[n];

    cadatraProdutos(p,n);
    while (1){
    printf("\n\nCodigo do produto para o pedido ou 0 para encerrar: ");
    scanf("%d",& busca);
    if(busca == 0){
        break;
    }
    printf("Quantidade do pedido: ");
    scanf("%d",& qntd);
    pedido(p,n,busca,qntd);
    }
}