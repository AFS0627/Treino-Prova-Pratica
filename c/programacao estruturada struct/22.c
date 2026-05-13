#include <stdio.h>
#include <string.h>

#define MAX 100

struct endereco{
    char rua[50];
    int numero;
    char complemento[50];
    char bairro[50];
    char cep[20];
    char cidade[50];
    char estado[50];
    char pais[50];
};

struct telefone{
    int ddd;
    char numero[20];
};

struct data{
    int dia;
    int mes;
    int ano;
};

struct pessoa{
    char nome[50];
    char email[50];

    struct endereco e;
    struct telefone t;
    struct data aniversario;

    char observacao[100];
};

void lerPessoa(struct pessoa *p){

    printf("\nNome: ");
    scanf(" %[^\n]", p->nome);

    printf("Email: ");
    scanf(" %[^\n]", p->email);

    printf("Rua: ");
    scanf(" %[^\n]", p->e.rua);

    printf("Numero: ");
    scanf("%d", &p->e.numero);

    printf("Complemento: ");
    scanf(" %[^\n]", p->e.complemento);

    printf("Bairro: ");
    scanf(" %[^\n]", p->e.bairro);

    printf("CEP: ");
    scanf(" %[^\n]", p->e.cep);

    printf("Cidade: ");
    scanf(" %[^\n]", p->e.cidade);

    printf("Estado: ");
    scanf(" %[^\n]", p->e.estado);

    printf("Pais: ");
    scanf(" %[^\n]", p->e.pais);

    printf("DDD: ");
    scanf("%d", &p->t.ddd);

    printf("Telefone: ");
    scanf(" %[^\n]", p->t.numero);

    printf("Dia aniversario: ");
    scanf("%d", &p->aniversario.dia);

    printf("Mes aniversario: ");
    scanf("%d", &p->aniversario.mes);

    printf("Ano aniversario: ");
    scanf("%d", &p->aniversario.ano);

    printf("Observacao: ");
    scanf(" %[^\n]", p->observacao);
}

void imprimirCompleto(struct pessoa p){

    printf("\n========================\n");

    printf("Nome: %s\n", p.nome);
    printf("Email: %s\n", p.email);

    printf("Endereco:\n");
    printf("Rua: %s\n", p.e.rua);
    printf("Numero: %d\n", p.e.numero);
    printf("Complemento: %s\n", p.e.complemento);
    printf("Bairro: %s\n", p.e.bairro);
    printf("CEP: %s\n", p.e.cep);
    printf("Cidade: %s\n", p.e.cidade);
    printf("Estado: %s\n", p.e.estado);
    printf("Pais: %s\n", p.e.pais);

    printf("Telefone: (%d) %s\n", p.t.ddd, p.t.numero);

    printf("Aniversario: %d/%d/%d\n",
           p.aniversario.dia,
           p.aniversario.mes,
           p.aniversario.ano);

    printf("Observacao: %s\n", p.observacao);

    printf("========================\n");
}

void imprimirResumo(struct pessoa p){

    printf("\nNome: %s\n", p.nome);
    printf("Telefone: (%d) %s\n", p.t.ddd, p.t.numero);
    printf("Email: %s\n", p.email);
}

void inserirPessoa(struct pessoa agenda[], int *n){

    struct pessoa nova;

    lerPessoa(&nova);

    int pos = *n;

    for(int i = 0; i < *n; i++){

        if(strcmp(nova.nome, agenda[i].nome) < 0){
            pos = i;
            break;
        }
    }

    for(int i = *n; i > pos; i--){
        agenda[i] = agenda[i - 1];
    }

    agenda[pos] = nova;

    (*n)++;

    printf("\nPessoa inserida com sucesso!\n");
}

void buscarNome(struct pessoa agenda[], int n, char nome[]){

    int achou = 0;

    for(int i = 0; i < n; i++){

        if(strstr(agenda[i].nome, nome) != NULL){

            imprimirCompleto(agenda[i]);

            achou = 1;
        }
    }

    if(!achou){
        printf("\nPessoa nao encontrada!\n");
    }
}

void buscarMes(struct pessoa agenda[], int n, int mes){

    int achou = 0;

    for(int i = 0; i < n; i++){

        if(agenda[i].aniversario.mes == mes){

            imprimirCompleto(agenda[i]);

            achou = 1;
        }
    }

    if(!achou){
        printf("\nNenhum aniversario nesse mes!\n");
    }
}

void buscarDiaMes(struct pessoa agenda[], int n, int dia, int mes){

    int achou = 0;

    for(int i = 0; i < n; i++){

        if(agenda[i].aniversario.dia == dia &&
           agenda[i].aniversario.mes == mes){

            imprimirCompleto(agenda[i]);

            achou = 1;
        }
    }

    if(!achou){
        printf("\nNenhum aniversario nessa data!\n");
    }
}

void removerPessoa(struct pessoa agenda[], int *n, char nome[]){

    int pos = -1;

    for(int i = 0; i < *n; i++){

        if(strcmp(agenda[i].nome, nome) == 0){

            pos = i;
            break;
        }
    }

    if(pos == -1){

        printf("\nPessoa nao encontrada!\n");
        return;
    }

    for(int i = pos; i < *n - 1; i++){
        agenda[i] = agenda[i + 1];
    }

    (*n)--;

    printf("\nPessoa removida!\n");
}

void imprimirAgenda(struct pessoa agenda[], int n){

    int op;

    printf("\n1 - Nome, telefone e email");
    printf("\n2 - Todos os dados");
    printf("\nOpcao: ");
    scanf("%d", &op);

    for(int i = 0; i < n; i++){

        if(op == 1){
            imprimirResumo(agenda[i]);
        }
        else if(op == 2){
            imprimirCompleto(agenda[i]);
        }
    }
}

int main(){

    struct pessoa agenda[MAX];

    int n = 0;

    int op;

    char nome[50];

    int mes, dia;

    do{

        printf("\n========== MENU ==========");
        printf("\n1 - Inserir pessoa");
        printf("\n2 - Buscar por nome");
        printf("\n3 - Buscar por mes aniversario");
        printf("\n4 - Buscar por dia e mes");
        printf("\n5 - Remover pessoa");
        printf("\n6 - Imprimir agenda");
        printf("\n0 - Sair");

        printf("\nOpcao: ");
        scanf("%d", &op);

        switch(op){

            case 1:

                inserirPessoa(agenda, &n);
                break;

            case 2:

                printf("Digite o nome: ");
                scanf(" %[^\n]", nome);

                buscarNome(agenda, n, nome);

                break;

            case 3:

                printf("Digite o mes: ");
                scanf("%d", &mes);

                buscarMes(agenda, n, mes);

                break;

            case 4:

                printf("Digite o dia: ");
                scanf("%d", &dia);

                printf("Digite o mes: ");
                scanf("%d", &mes);

                buscarDiaMes(agenda, n, dia, mes);

                break;

            case 5:

                printf("Digite o nome para remover: ");
                scanf(" %[^\n]", nome);

                removerPessoa(agenda, &n, nome);

                break;

            case 6:

                imprimirAgenda(agenda, n);

                break;

            case 0:

                printf("\nPrograma encerrado!\n");
                break;

            default:

                printf("\nOpcao invalida!\n");
        }

    }while(op != 0);

    return 0;
}