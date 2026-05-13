#include <stdio.h>
struct produto{
    int cod;
    char nome[20];
    float preco;
    int qntdEstoque;
};
struct produto Cadastro(struct produto p, int i){
    printf("codigo do produto %d : ",i+1);
    scanf("%d",&p.cod);
    printf("nome do produto %d : ",i+1);
    scanf(" %[^\n]", p.nome);
    printf("preco do produto %d : ",i+1);
    scanf("%f",&p.preco);
    printf("qntdEstoque do produto %d : ",i+1);
    scanf("%d",&p.qntdEstoque);
    while (p.qntdEstoque < 0){
        printf("qntdEstoque do produto %d precisa ser maior que 0: ",i+1);
    scanf("%d",&p.qntdEstoque);
    }
    printf("\n\n");

    return p;
    
}
struct produto AtualizaEstoque(struct produto p){
    int qntd;
    printf("\nQuantidade para vender:");
    scanf("%d",&qntd);
    if(p.qntdEstoque < qntd){
        printf("\n\nQuantidade insuficiente no estoque\nquantidade atual: %d",p.qntdEstoque);
        return p;
    }else{
    p.qntdEstoque -= qntd;
    printf("\n\nproduto atualizado no estoque\nquantidade atual: %d",p.qntdEstoque);
    return p;
    }

}
int BuscaProduto(struct produto p[],int n){
    int cod = 0;
    int encontrado = 0;
    printf("\n\nCodigo do produto para vender:");
    scanf("%d",&cod);
    for(int i =0;i<n;i++){
        if(p[i].cod == cod){
            encontrado++;
            return i;
        }

    }
    if(encontrado == 0){
        printf("produto não encontrado");
        return -1;
    }
}
void listar(struct produto p[],int n){
    for(int i =0;i<n;i++){
    printf("\n\nProduto %d:\ncod: %d\nnome: %s\npreco: %.2f\nquantidade estoque: %d\n\n",i+1,p[i].cod,p[i].nome,p[i].preco,p[i].qntdEstoque);
    }
}
int main(){
    int n = 5;
    struct produto p[n];
    int busca,i,escolha;

    while(1){
        printf("1- cadastrar produtos\n2- vender\n3- listar\n0- sair\n:");
        scanf("%d",& escolha);
        if(escolha == 0){
            break;
        }
        switch(escolha){
            case 1:
            for(int i=0;i<n;i++){
                p[i] = Cadastro(p[i],i);
            }
            break;
            case 2:
            i = BuscaProduto(p,n);
            if(i != -1){
            p[i] = AtualizaEstoque(p[i]);
            break;
            }
            case 3:
             listar(p, n);
    break;
    case 0:
    break;

        }
    }
}