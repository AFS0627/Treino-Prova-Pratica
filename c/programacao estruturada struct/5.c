#include <stdio.h>

struct aluno{
    char matricula[10];
    char nome[100];
    int codDiscoplina;
    float nota1, nota2;
};

float mediaPonderado(struct aluno aNota){
    float media;
    media = ((aNota.nota1 + (aNota.nota2 * 2)) / 3);
    return media;
}

int main(){
    int n = 2;
    struct aluno a[n];

    for(int i = 0; i < n; i++){
        printf("matricula do aluno %d:",i+1);
        scanf("%s", a[i].matricula);
        printf("nome do aluno %d:",i+1);
        scanf(" %[^\n]", a[i].nome);
        printf("codDiscoplina do aluno %d:",i+1);
        scanf("%d", & a[i].codDiscoplina);
        printf("nota1 do aluno %d:",i+1);
        scanf("%f", & a[i].nota1);
        printf("nota2 do aluno %d:",i+1);
        scanf("%f", & a[i].nota2);
    }
    for(int i = 0;i < n;i++){
        float media = mediaPonderado(a[i]);
        printf("ALUNO %d:\n\nnome: %s\nMedia: %.2f\n\n",i+1,a[i].nome,media);
    }
}


