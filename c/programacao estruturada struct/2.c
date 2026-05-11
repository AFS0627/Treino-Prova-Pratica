#include <stdio.h>


struct pessoa{
    char nome[100];
    int idade;
    char endereco[100];
};
void imprimePessoa(struct pessoa p){
    printf("nome: %s\nIdade: %d\nEndereco: %s\n",p.nome,p.idade,p.endereco);
}
int main() {
struct pessoa p1;

printf("nome: ");
scanf("%[^\n]",  p1.nome);
printf("idade: ");
scanf("%d", & p1.idade);
printf("endereco: ");
scanf("%s",  p1.endereco);

imprimePessoa(p1);

}