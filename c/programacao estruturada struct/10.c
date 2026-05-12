#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct carta{

    char naipe[20];
    char valor[20];
};

int main(){

    struct carta baralho[52];

    char naipes[4][20] = {
        "Copas",
        "Espadas",
        "Ouros",
        "Paus"
    };

    char valores[13][20] = {
        "A",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "J",
        "Q",
        "K"
    };

    struct carta jogador1[5];
    struct carta jogador2[5];

    int usado[52] = {0};

    int k = 0;

    // Monta o baralho
    for(int i = 0; i < 4; i++){

        for(int j = 0; j < 13; j++){

            baralho[k].valor[0] = '\0';

            sprintf(baralho[k].valor, "%s", valores[j]);
            sprintf(baralho[k].naipe, "%s", naipes[i]);

            k++;
        }
    }

    srand(time(NULL));

    for(int i = 0; i < 5; i++){

        int sorteio;

        do{
            sorteio = rand() % 52;
        }while(usado[sorteio] == 1);

        usado[sorteio] = 1;

        jogador1[i] = baralho[sorteio];
    }

    for(int i = 0; i < 5; i++){

        int sorteio;

        do{
            sorteio = rand() % 52;
        }while(usado[sorteio] == 1);

        usado[sorteio] = 1;

        jogador2[i] = baralho[sorteio];
    }

    printf("\n===== JOGADOR 1 =====\n");

    for(int i = 0; i < 5; i++){

        printf("%s de %s\n",
               jogador1[i].valor,
               jogador1[i].naipe);
    }

    printf("\n===== JOGADOR 2 =====\n");

    for(int i = 0; i < 5; i++){

        printf("%s de %s\n",
               jogador2[i].valor,
               jogador2[i].naipe);
    }

    return 0;
}