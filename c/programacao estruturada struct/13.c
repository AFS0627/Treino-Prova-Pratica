#include <stdio.h>
#include <string.h>

struct livro{
    char titulo[30];
    char autor[15];
    int ano;

};
void buscarLivro(struct livro lb[],char titulo[],int n){
  int encontrado = 0;
  for (int i=0;i<n;i++){
    if(strcmp(lb[i].titulo, titulo)==0){
        printf("\ntitulo: %s\nautor: %s\nano: %d\n",lb[i].titulo,lb[i].autor,lb[i].ano);
        encontrado++;
    }

  } 
  printf("Foram encontrados %d livros\n",encontrado); 

}

int main(){
    char busca[31];
    int n = 5;
    struct livro l[n];
    for (int i=0;i<n;i++){
        printf("titulo livro %d: ",i+1);
        scanf(" %[^\n]",l[i].titulo);
        printf("Autor do livro %d: ",i+1);
        scanf(" %[^\n]",l[i].autor);
        printf("ano do livro %d: ",i+1);
        scanf("%d", &l[i].ano);
        

    }
    printf("\n\nDigite um titulo para buscar: ");
    scanf(" %[^\n]", busca);
    buscarLivro(l,busca,n);
}