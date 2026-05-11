#include <stdio.h>

struct aluno{
    char nome[100];
    char matricula[20];
    char curso[50];
};

void imprimeAlunos(int tamanhoVetor, struct aluno a[]){
    for (int i = 0; i < tamanhoVetor; i++){
    printf("aluno %d\n\nnome: %s\nmatricula: %s\ncurso: %s\n\n",i+1,a[i].nome,a[i].matricula,a[i].curso);
}}

int main(){
 int tamanhoVetor = 5;
 struct aluno alunos[tamanhoVetor];
 
 for(int i = 0; i < tamanhoVetor; i++){
    printf("nome do aluno %d: ",i+1);
    scanf("%[^\n]", alunos[i].nome);
    printf("matricula do aluno %d: ",i+1);
    scanf("%s", alunos[i].matricula);
    printf("curso do aluno %d: ",i+1);
    scanf("%s", alunos[i].curso);
 }
 imprimeAlunos(tamanhoVetor,alunos);

}