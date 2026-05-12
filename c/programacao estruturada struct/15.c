#include <stdio.h>

struct eletrodomestico{
    char nome[15];
    float potencia;
    float horasAtivo;
};

void lerEletrodomesticos(struct eletrodomestico e[],int n){
    for(int i =0; i<n;i++){
        printf("Nome do eletrodomestico %d:",i+1);
        scanf(" %[^\n]",e[i].nome);
        printf("potencia do eletrodomestico %d em KW:",i+1);
        scanf("%f",&e[i].potencia);
        printf("horasAtivo do eletrodomestico %d por dia:",i+1);
        scanf("%f",&e[i].horasAtivo);

    }
}
float consumoTotal(struct eletrodomestico e[], int n,float t){
    float consumoDiario = 0;
    for(int i =0; i<n;i++){
        consumoDiario = consumoDiario + (e[i].potencia * e[i].horasAtivo);
}
    return consumoDiario * t;
}
void consumoDiarioEquipamento(struct eletrodomestico e[],int n){
    for(int i =0; i<n;i++){
        printf("\n\nEquipamentos:\nnome: %s\npotencia: %.2f\nhoras ativo: %.2f\nConsumo Diario: %.2fKW",e[i].nome,e[i].potencia,e[i].horasAtivo,e[i].potencia * e[i].horasAtivo);
    }
}
int main(){
    float consTotal,t;
    int n=5;
    struct eletrodomestico e[n];

    lerEletrodomesticos(e,n);
    printf("\nDias ligado:");
    scanf("%f",&t);
    consTotal = consumoTotal(e,n,t);
    consumoDiarioEquipamento(e,n);
    printf("\n\nConsumo total e %fKW",consTotal);

}