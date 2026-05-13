#include <stdio.h>
#include <string.h>

struct endereco{
    char rua[20];
    char bairro[20];
    char cidade[20];
    char estado[20];
    char cep[20];
};

struct cadastro{
    char nome[50];
    struct endereco e;
    float salario;
    char identidade[20];
    char cpf[13];
    char estadoCivil[20];
    char telefone[20];
    int idade;
    char sexo;
};

void cadastrarPessoas(struct cadastro c[], int n){

    for(int i = 0; i < n; i++){

        printf("\n--- CADASTRO de pessoa %d ---\n",i+1);

        printf("Nome: ");
        scanf(" %[^\n]", c[i].nome);

        printf("Rua: ");
        scanf(" %[^\n]", c[i].e.rua);

        printf("Bairro: ");
        scanf(" %[^\n]", c[i].e.bairro);

        printf("Cidade: ");
        scanf(" %[^\n]", c[i].e.cidade);

        printf("Estado: ");
        scanf(" %[^\n]", c[i].e.estado);

        printf("CEP: ");
        scanf(" %[^\n]", c[i].e.cep);

        printf("Salario: ");
        scanf("%f", &c[i].salario);

        printf("Identidade: ");
        scanf(" %[^\n]", c[i].identidade);

        printf("CPF: ");
        scanf(" %[^\n]", c[i].cpf);

        printf("Estado civil: ");
        scanf(" %[^\n]", c[i].estadoCivil);

        printf("Telefone: ");
        scanf(" %[^\n]", c[i].telefone);

        printf("Idade: ");
        scanf("%d", &c[i].idade);

        printf("Sexo (M/F): ");
        scanf(" %c", &c[i].sexo);
    }
}

void imprimirPessoa(struct cadastro c[],int n, int i){
    printf("\n=========== PESSOA %d ===========\n", i + 1);

        printf("Nome: %s\n", c[i].nome);

        printf("Rua: %s\n", c[i].e.rua);
        printf("Bairro: %s\n", c[i].e.bairro);
        printf("Cidade: %s\n", c[i].e.cidade);
        printf("Estado: %s\n", c[i].e.estado);
        printf("CEP: %s\n", c[i].e.cep);

        printf("Salario: %.2f\n", c[i].salario);

        printf("Identidade: %s\n", c[i].identidade);

        printf("CPF: %s\n", c[i].cpf);

        printf("Estado civil: %s\n", c[i].estadoCivil);

        printf("Telefone: %s\n", c[i].telefone);

        printf("Idade: %d\n", c[i].idade);

        printf("Sexo: %c\n", c[i].sexo);

        printf("=================================\n"); 
}
void maiorIdade(struct cadastro c[],int n){
    struct cadastro maior;
    int maiorI = 0;
    for(int i=0;i<n;i++){
        if(i == 0){
            maior = c[i];
            maiorI = i;
        } else if(c[i].idade > maior.idade){
            maior = c[i];
            maiorI = i;
        }

    }
    imprimirPessoa(c,n,maiorI);

}
void PessoasMasculino(struct cadastro c[],int n){
    int encontrado = 0;
    printf("\npessoas do sexo masculino:\n");
    for(int i =0;i<n;i++){
        if(c[i].sexo == 'M'){
            imprimirPessoa(c,n,i);
        encontrado++;
        }
    }
    if (encontrado == 0){
        printf("\nNão foram encontradas pessoas do sexo masculino");
    }
}
void salarioMaior1000(struct cadastro c[],int n){
    int encontrado = 0;
    printf("\npessoas com salario maior que 1000:\n");
    for(int i =0;i<n;i++){
        if(c[i].salario > 1000){
            
             imprimirPessoa(c,n,i);
        encontrado++;
        }
    }
    if (encontrado == 0){
        printf("\nNão foram encontradas pessoas com salario maior que 1000");
    }
}

void achaIdentidade(struct cadastro c[],int n){
    int encontrado = 0;
    char busca[20];
    printf("\n\nDigite a identidade para buscar:");
    scanf(" %[^\n]", busca);
    
    for(int i =0;i<n;i++){
        if(strcmp(c[i].identidade,busca) == 0){
            
             imprimirPessoa(c,n,i);
        encontrado++;
        }
    }
    if (encontrado == 0){
        printf("\nNão foram encontradas pessoas com essa identidade");
    }
}
int main(){
    int n = 2;
    struct cadastro c[n];
    int escolha;
    
    while(1){
    printf("\n\n1- preencher esse 5 cadastros.\n2- maior idade entre os cadastrados\n3-  Encontre as pessoas do sexo masculino\n4- Encontre as pessoas com salario maior que 1000\n5- Imprima os dados da pessoa cuja identidade seja igual a um valor fornecido pelo usuário \n0- sair\n:");
    scanf("%d",&escolha);
    
    switch (escolha)
    {
    case 1:
        cadastrarPessoas(c,n);
        break;
    case 2:
        maiorIdade(c,n);
        break;
    case 3:
        PessoasMasculino(c,n);
        break;
    case 4:
        salarioMaior1000(c,n);
        break;
    case 5:
        achaIdentidade(c,n);
        break;
    case 0:
        break;
    }
    if(escolha == 0){
        break;
    }
}
}
    
