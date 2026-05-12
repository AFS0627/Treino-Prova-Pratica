#include <stdio.h>

struct carro{

    char marca[15];
    int ano;
    float preco;
};
struct carro lerCarro(){

    struct carro c;

    printf("\nMarca: ");
    scanf(" %[^\n]", c.marca);

    printf("Ano: ");
    scanf("%d", &c.ano);

    printf("Preco: ");
    scanf("%f", &c.preco);

    return c;
}
void mostrarCarros(struct carro v[], int tamanho, float P){

    int encontrou = 0;

    printf("\nCarros com preco menor que %.2f\n", P);

    for(int i = 0; i < tamanho; i++){

        if(v[i].preco < P){

            printf("\nMarca: %s\n", v[i].marca);
            printf("Ano: %d\n", v[i].ano);
            printf("Preco: %.2f\n", v[i].preco);

            encontrou = 1;
        }
    }

    if(encontrou == 0){
        printf("Nenhum carro encontrado.\n");
    }
}

int main(){

    struct carro carros[5];

    float P;
    for(int i = 0; i < 5; i++){

        printf("\n===== CARRO %d =====\n", i + 1);

        carros[i] = lerCarro();
    }
    do{

        printf("\nDigite um valor P (0 para sair): ");
        scanf("%f", &P);

        if(P != 0){

            mostrarCarros(carros, 5, P);
        }

    }while(P != 0);

    return 0;
}