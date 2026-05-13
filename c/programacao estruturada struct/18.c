#include <stdio.h>
#include <string.h>

struct ingrediente{
    char nome[25];
    int qntd;
};
struct receita{
    char nome[25];
    int qntdI;
    struct ingrediente ing[20];
};

void encontrarReceita (struct receita r[], int n,char busca[]){
    int encontrado = 0;
    for(int i =0;i<n;i++){
        if(strcmp(r[i].nome,busca) == 0){
            printf("\n\ningredientes da receita %d:\n\n",i+1);
            for(int j =0;j<r[i].qntdI;j++){
                printf("nome ingrediente : %s\nQuantidade: %d\n\n",r[i].ing[j].nome,r[i].ing[j].qntd);
            }
            encontrado = 1;
        }
    }
    if(encontrado == 0){
        printf("\nreceita nao encontrada");
    }
}

int main(){
    int n = 5;
    struct receita r[5];
    char nomeBusca[25];
    for (int i = 0;i < n;i++){
    printf("Nome receita %d: ",i+1);
    scanf(" %[^\n]", r[i].nome);
    printf("quantidade de igredientes receita %d: ",i+1);
    scanf("%d", &r[i].qntdI);
getchar();
    
    for(int j = 0;j < r[i].qntdI;j++){
       printf("Nome do ingrediente %d da receita %d: ",j+1,i+1);
    scanf(" %[^\n]", r[i].ing[j].nome);
    printf("quantidade de igrediente %d da receita %d: ",j+1,i+1);
    scanf("%d", &r[i].ing[j].qntd);
getchar();
    }
    }

    while (1){
        printf("\n\nNome da receita para buscar: ");
         fgets(nomeBusca, 25, stdin);

    nomeBusca[strcspn(nomeBusca, "\n")] = '\0';

    if(strlen(nomeBusca) == 0){
        break;
    }

    encontrarReceita(r,n,nomeBusca);
}

    

}