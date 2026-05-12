#include <stdio.h>

struct aluno{
    char nome[100];
    char matricula[15];
    float media_final;
};

int main(){
    int n = 10;
    struct aluno a[n];
    int countAprovados = 0, countReprovados = 0;

    for (int i =0; i<n;i++){
        printf("Nome do aluno %d:",i+1);
        scanf(" %[^\n]", a[i].nome);
        printf("matricula do aluno %d:",i+1);
        scanf(" %s", a[i].matricula);
        printf("media_final do aluno %d:",i+1);
        scanf("%f", &a[i].media_final);
        while(a[i].media_final < 0 || a[i].media_final > 10){
           printf("media_final do aluno %d precisa ser de 0 a 10:",i+1);
        scanf("%f", &a[i].media_final); 
        }

        if(a[i].media_final >=5){
            countAprovados++;
        }else{
            countReprovados++;
        }

    }
    int j = 0,k = 0;
    struct aluno reprovados[countReprovados];
    struct aluno aprovados[countAprovados];
    for (int i=0;i<n;i++){
       if(a[i].media_final >=5){
            aprovados[j] = a[i];
            j++;
        }else{
            reprovados[k] = a[i];
            k++;
            
        } 
    }
    printf("\n\nAPROVADOS:");
    for (int i=0;i<countAprovados;i++){
        printf("\nNome: %s\nMatricula: %s\nMedia final: %.2f\n",aprovados[i].nome,aprovados[i].matricula,aprovados[i].media_final);

    }
     printf("\n\nREPROVADOS:");
    for (int i=0;i<countReprovados;i++){
        printf("\nNome: %s\nMatricula: %s\nMedia final: %.2f\n",reprovados[i].nome,reprovados[i].matricula,reprovados[i].media_final);
        
    }
}