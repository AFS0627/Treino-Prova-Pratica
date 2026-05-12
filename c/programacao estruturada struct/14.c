#include <stdio.h>
struct data{
    int dia;
    int mes;
    int ano;
};
struct Compromisso{
    char compromisso[60];
    struct data dataCompromisso;
};

void lerCompromisso(struct Compromisso c[],int n){
    for(int i =0;i<n;i++){
        printf("compromisso %d: ",i+1);
        scanf(" %[^\n]",c[i].compromisso);

        printf("dia %d: ",i+1);
        scanf("%d",& c[i].dataCompromisso.dia);

        printf("mes %d: ",i+1);
        scanf("%d",& c[i].dataCompromisso.mes);

        printf("ano %d: ",i+1);
        scanf("%d",& c[i].dataCompromisso.ano);
    }
}
void mostrarCompromisso(struct Compromisso c[],int n){
    printf("\n\nLISTAGEM DE COMPROMISSO:\n\n");
    for(int i=0;i<n;i++){
        printf("compromisso: %s\ndia: %d\nmes: %d\nAno: %d\n\n",c[i].compromisso,c[i].dataCompromisso.dia,c[i].dataCompromisso.mes,c[i].dataCompromisso.ano);
    }
}
void compromissosMA(struct Compromisso c[],int n,int m,int a){
    for(int i = 0;i < n;i++){
        if(m==c[i].dataCompromisso.mes && a==c[i].dataCompromisso.ano){
                  printf("compromisso: %s\ndia: %d\nmes: %d\nAno: %d\n\n",c[i].compromisso,c[i].dataCompromisso.dia,c[i].dataCompromisso.mes,c[i].dataCompromisso.ano);  
        }
    }
}

int main(){
    int m,a;
    int n = 5;
    struct Compromisso c[n];

    lerCompromisso(c,n);

    mostrarCompromisso(c,n);

    m = 1;
    while(m != 0){
    printf("Digite mes para procurar ou 0 para encerrar:");
    scanf("%d",& m);
    if(m == 0){
        break;
    }
    printf("Digite ano para procurar:");
    scanf("%d",& a);

    compromissosMA(c,n,m,a);
    }


}