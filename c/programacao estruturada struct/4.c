#include <stdio.h>

struct aluno{
    char matricula[20];
    char nome[100];
    float nota1;
    float nota2;
    float nota3;
};

int main(){
    struct aluno alunos[5];
    struct aluno maiorNota1;
    struct aluno maiorMedia;
    struct aluno menorMedia;
    int n = 5;

    for(int i = 0;i < n; i++){
        printf("matricula do aluno %d: ",i+1);
        scanf("%s", alunos[i].matricula);
        printf("nome do aluno %d: ",i+1);
        scanf("%[^\n]", alunos[i].nome);
        printf("nota1 do aluno %d: ",i+1);
        scanf("%f",& alunos[i].nota1);
        printf("nota2 do aluno %d: ",i+1);
        scanf("%f", & alunos[i].nota2);
        printf("nota3 do aluno %d: ",i+1);
        scanf("%f",& alunos[i].nota3);

        if (i == 0){
            maiorNota1 = alunos[i];
            maiorMedia = alunos[i];
            menorMedia = alunos[i];
        }else if(maiorNota1.nota1 < alunos[i].nota1){
            maiorNota1 = alunos[i];
        } if(((alunos[i].nota1 + alunos[i].nota2 + alunos[i].nota3) / 3) > ((maiorMedia.nota1 + maiorMedia.nota2 + maiorMedia.nota3) / 3)){
        maiorMedia = alunos[i];
    } if (((alunos[i].nota1 + alunos[i].nota2 + alunos[i].nota3) / 3) < ((menorMedia.nota1 + menorMedia.nota2 + menorMedia.nota3) / 3)){
        menorMedia = alunos[i];
    }
   
    }
    for (int i =0;i<n;i++){
        if(((alunos[i].nota1 + alunos[i].nota2 + alunos[i].nota3) / 3) >= 6){
            printf("aluno %d:\n\nMatricula: %s\nnome: %s\nnota 1: %f\nnota 2: %f\nnota 3: %f\nAPROVADO\n\n",i+1,alunos[i].matricula,alunos[i].nome,alunos[i].nota1,alunos[i].nota2,alunos[i].nota3);
        }else{
printf("aluno %d\n\nMatricula: %s\nnome: %s\nnota 1: %f\nnota 2: %f\nnota 3: %f\nREPROVADO\n\n",i+1,alunos[i].matricula,alunos[i].nome,alunos[i].nota1,alunos[i].nota2,alunos[i].nota3);
        }

    }
    printf("aluno com maior nota 1:\n\nMatricula: %s\nnome: %s\nnota 1: %f\nnota 2: %f\nnota 3: %f\n\n",maiorNota1.matricula,maiorNota1.nome,maiorNota1.nota1,maiorNota1.nota2,maiorNota1.nota3);
    printf("aluno com maior media:\n\nMatricula: %s\nnome: %s\nnota 1: %f\nnota 2: %f\nnota 3: %f\n\n",maiorMedia.matricula,maiorMedia.nome,maiorMedia.nota1,maiorMedia.nota2,maiorMedia.nota3);
     printf("aluno com menor media:\n\nMatricula: %s\nnome: %s\nnota 1: %f\nnota 2: %f\nnota 3: %f\n\n",menorMedia.matricula,menorMedia.nome,menorMedia.nota1,menorMedia.nota2,menorMedia.nota3);
    


}