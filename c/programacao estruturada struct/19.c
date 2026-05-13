#include <stdio.h>
#include <string.h>

struct filme{
    char nome[20];
    int ano;
    float duracao;
};

struct diretor{
    char nome[20];
    int qntdFilmes;
    struct filme f[20];
};

void lerDiretores(struct diretor d[],int n){
    for(int i=0;i<n;i++){
        printf("nome do diretor %d: ",i+1);
        scanf(" %[^\n]",d[i].nome);
        printf("qntdFilmes do diretor %d: ",i+1);
        scanf(" %d",&d[i].qntdFilmes);
        
        for(int j = 0;j<d[i].qntdFilmes;j++){
            printf("nome do filme %d do diretor %s:",j+1,d[i].nome);
            scanf(" %[^\n]",&d[i].f[j].nome);
            printf("ano do filme %d do diretor %s:",j+1,d[i].nome);
            scanf("%d",&d[i].f[j].ano);
            printf("duracao do filme %d do diretor %s em horas:",j+1,d[i].nome);
            scanf("%f",&d[i].f[j].duracao);
        }
    }

    }
    void BuscarFilmesDiretor(struct diretor d[],int n,char nomeDiretor[]){
        int encontrado = 0;
        for (int i =0;i<n;i++){
            if(strcmp(nomeDiretor, d[i].nome) == 0){
                encontrado++;
                for(int j = 0;j<d[i].qntdFilmes; j++){
                    printf("\n\nfilmes do diretor %s:\nNome: %s\nano: %d\nduracao: %f\n\n",d[i].nome,d[i].f[j].nome,d[i].f[j].ano,d[i].f[j].duracao);
                    
                }

            }
        }
        if(encontrado == 0){
            printf("\nNão foram encontrados filmes desse diretor\n");
        }
    }


    int main(){
        int n = 5;
        struct diretor d[n];
        char busca[20],buscaVazio[20];
        lerDiretores(d,n);
getchar();
        while(1){
            printf("\n\nDigite um nome de diretor para buscar filmes ou nada para continuar: ");
            fgets(busca,20,stdin);
            if(strlen(busca) == 1){
    break;
}
busca[strcspn(busca,"\n")] = '\0';
            BuscarFilmesDiretor(d,n,busca);
        }

    }
