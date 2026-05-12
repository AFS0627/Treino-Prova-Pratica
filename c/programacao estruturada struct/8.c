#include <stdio.h>
#include <string.h>

struct pessoa{
    char nome[100];
    char endereco[100];
    char telefone[20];
};

int main(){
    struct pessoa aux;
    int n = 5;
    struct pessoa p[n];
    for(int i =0;i < n; i++){
        printf("nome da pessoa %d:",i+1);
        scanf(" %[^\n]", p[i].nome);
        printf("endereco da pessoa %d:",i+1);
        scanf(" %[^\n]", p[i].endereco);
        printf("telefone da pessoa %d:",i+1);
        scanf(" %s", p[i].telefone);


    }
    for(int i = 0;i < n-1; i++){
        for(int j = i+1; j < n; j++){
            if(strcmp(p[i].nome ,p[j].nome) > 0){
                aux = p[i];
                p[i] = p[j];
                p[j] = aux;
            }
        }
    }
    for(int i =0;i < n; i++){
        printf("\n\n Pessoa %d:\n\nNome: %s\nEndereco: %s\nTelefone: %s",i+1,p[i].nome,p[i].endereco,p[i].telefone);
    }
}