#include <stdio.h>

struct voos{
    int codAO;
    int codAD;

};
struct aeroporto{
    int cod;
    int qntdO;
    int qntdD;
};

int main(){
    int n = 5;
    struct voos v[n];
    struct aeroporto a[n];
    
    for(int i =0;i<n;i++){
        printf("codigo do aeroporto %d:",i+1);
        scanf("%d",&a[i].cod);

        while(a[i].cod < 0 && a[i].cod > n){
         printf("codigo do aeroporto %d invalido tente novamente:",i+1);
        scanf("%d",&a[i].cod);  
        }

        a[i].qntdO = 0;
        a[i].qntdD = 0;
    }
    for(int i =0;i<n;i++){
        printf("codigo do aeroporto de origem do voo %d:",i+1);
        scanf(" %d",&v[i].codAO);

        while(v[i].codAO < 0 && v[i].codAO > n){
         printf("codigo do aeroporto de origem do voo %d invalido digite novamente:",i+1);
        scanf(" %d",&v[i].codAO);   
        }

        printf("codigo do aeroporto de destino do voo %d:",i+1);
        scanf(" %d",&v[i].codAD);

        while(v[i].codAD < 0 && v[i].codAD >= n){
         printf("codigo do aeroporto de destino do voo %d invalido digite novamente:",i+1);
        scanf(" %d",&v[i].codAO);   
        }
        
        for(int j = 0;j<n;j++){
            if(v[i].codAO == a[j].cod){
                a[j].qntdO++;
                
            }if(v[i].codAD == a[j].cod){
                a[j].qntdD++;
            }
        }

    }
    printf("\n\nAEROPORTOS:");
    for(int i=0;i<n;i++){
        printf("\ncod: %d\nQuantidade de voos de origem: %d\nQuantidade de voos de destino: %d\n\n",a[i].cod,a[i].qntdO,a[i].qntdD);
    }

}