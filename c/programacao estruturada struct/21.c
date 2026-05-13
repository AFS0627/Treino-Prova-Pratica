#include <stdio.h>

struct dma{
    int dia;
    int mes;
    int ano;
};



int bissexto(int ano){

    if((ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0)){
        return 1;
    }

    return 0;
}

int diasNoMes(int mes, int ano){

    if(mes == 2){

        if(bissexto(ano)){
            return 29;
        }

        return 28;
    }

    if(mes == 4 || mes == 6 || mes == 9 || mes == 11){
        return 30;
    }

    return 31;
}

int converterDias(struct dma d){

    int total = 0;
    for(int i = 1; i < d.ano; i++){

        if(bissexto(i)){
            total += 366;
        } else {
            total += 365;
        }
    }
    for(int i = 1; i < d.mes; i++){
        total += diasNoMes(i, d.ano);
    }
    total += d.dia;

    return total;
}

int main(){

    struct dma d1, d2;

    printf("Digite a primeira data (dd mm aaaa): ");
    scanf("%d %d %d", &d1.dia, &d1.mes, &d1.ano);

    printf("Digite a segunda data (dd mm aaaa): ");
    scanf("%d %d %d", &d2.dia, &d2.mes, &d2.ano);

    int dias1 = converterDias(d1);
    int dias2 = converterDias(d2);

    int diferenca;

    if(dias1 > dias2){
        diferenca = dias1 - dias2;
    } else {
        diferenca = dias2 - dias1;
    }

    printf("\nQuantidade de dias entre as datas: %d\n", diferenca);
}