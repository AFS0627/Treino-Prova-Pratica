#include <stdio.h>
#include <string.h>

struct produto{
    int cod;
    char nome[20];
    float preco;
    int qntdEstoque;
};
void cadastroProdutos(struct produto p[],int n){
    for (int i = 0;i < n;i++){
        printf("cod produto %d:",i+1);
        scanf("%d",&p[i].cod);
        printf("nome produto %d:",i+1);
        scanf(" %[^\n]", p[i].nome);
        printf("preco produto %d:",i+1);
        scanf("%f",&p[i].preco);
        printf("qntd do estoque produto %d:",i+1);
        scanf("%d",&p[i].qntdEstoque);
        while(p[i].qntdEstoque < 0){
            printf("qntd do estoque produto %d precisa ser maior que 0:",i+1);
        scanf("%d",&p[i].qntdEstoque);
        }
    }
}
struct produto atualizarEstoque(struct produto p,int qntd){
    p.qntdEstoque -= qntd;
    printf("\n\nProduto vendido com sucesso\nQuantidade restante: %d",p.qntdEstoque);
    return p;
}
void vender(struct produto p[],int n){
        int cod,qntd,encontrado = 0;
        printf("codigo do produto para venda:");
        scanf("%d",&cod);
        printf("qunatidade da venda:");
        scanf("%d",&qntd);
        for(int i = 0;i<n;i++){
            if(cod == p[i].cod && qntd <= p[i].qntdEstoque){
                p[i] = atualizarEstoque(p[i],qntd);
                encontrado = 1;
            }else if (p[i].cod == cod){
                printf("\n\no produto não tem quantidade suficiente para esta venda\nQuantidade atual do produto: %d",p[i].qntdEstoque);
            }
        }
        if(encontrado == 0){
            printf("produto não encontrado");
        }
}
void mostrarProdutos(struct produto p[],int n){
    for(int i =0;i<n;i++){
        printf("\n\nProduto %d:\n",i+1);
        printf("cod: %d\nnome: %s\nPreco %.2f\nquantidade em estoque: %d",p[i].cod,p[i].nome,p[i].preco,p[i].qntdEstoque);

    }
}

int main(){
    int n = 2;
    struct produto p[n];
    int escolha;
    while(1){
        printf("\n\n1- Cadastar produtos\n2- vender produto\n3- listar produtos\n0- sair\n");
        scanf("%d",&escolha);
        if(escolha == 0){
            break;
        }
        switch(escolha){
            case 1:
            cadastroProdutos(p,n);
            break;
            case 2:
            vender(p,n);
            break;
            case 3:
            mostrarProdutos(p,n);
            break;

        }
    }
}
