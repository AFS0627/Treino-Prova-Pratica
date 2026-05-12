#include <stdio.h>
#include <string.h>
struct pessoa{
    char nome[100];
    char endereco[100];
    char dataNac[10];
    char cidade[50];
    char cep[15];
    char email[50];
};

void ValidaStructPessoa(struct pessoa valida){

    if(strlen(valida.dataNac) != 10 && valida.dataNac[2] != '/' && valida.dataNac[5] != '/'){
       printf("\n\nData invalida!\n");
    } else {
printf("\n\nData correta!\n");
    }
    if (strlen(valida.cep) != 9 && valida.cep[5] != '-'){
        printf("cep invalido!\n");
    }else{
        printf("CEP correto!\n");
    }
    if(strchr(valida.email, '@') == NULL && strchr(valida.email,'.') == NULL ){
       printf("Email invalido!\n");
    }else{
        printf("Data correta!\n");
    }
    
}
int main(){
    struct pessoa p;
    printf("nome da pessoa:");
    scanf(" %[^\n]", p.nome);
    printf("endereco da pessoa:");
    scanf(" %[^\n]", p.endereco);
    printf("dataNac da pessoa DD/MM/YYYY:");
    scanf(" %s", p.dataNac);
    printf("cidade da pessoa:");
    scanf(" %[^\n]", p.cidade);
    printf("cep da pessoa:");
    scanf(" %s", p.cep);
    printf("email da pessoa:");
    scanf(" %s", p.email);

    ValidaStructPessoa(p);
    printf("\n Informacoes");
    printf("\nnome da pessoa: %s\n",p.nome);
    printf("endereco da pessoa: %s\n",p.endereco);
    printf("dataNac da pessoa: %s\n",p.dataNac);
    printf("cidadeda pessoa: %s\n",p.cidade);
    printf("cep da pessoa: %s\n",p.cep);
    printf("email da pessoa: %s\n",p.email);
}
