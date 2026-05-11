#include <stdio.h>
#include <string.h>

int main() {

    struct Horario {
        int hora;
        int minutos;
        int segundos;
    };

    struct Data {
        int dia;
        int mes;
        int ano;
    };

    struct compromisso {
        struct Data datacompromisso;   
        struct Horario horariocompromisso;
        char descricao[50];    
    };

    struct compromisso Evento = {
        {10, 5, 2026},   
        {14, 30, 0},       
        "Reuniao"           
    };


    printf("Data: %02d/%02d/%d\n", Evento.datacompromisso.dia, Evento.datacompromisso.mes, Evento.datacompromisso.ano);
    printf("Hora: %02d:%02d:%02d\n", Evento.horariocompromisso.hora, Evento.horariocompromisso.minutos, Evento.horariocompromisso.segundos);
    printf("Descricao: %s\n\n", Evento.descricao);

    Evento.datacompromisso.dia = 15;
    Evento.horariocompromisso.hora = 16;
    strcpy(Evento.descricao, "Aula de C");

    printf("Nova Data: %02d/%02d/%d\n", Evento.datacompromisso.dia, Evento.datacompromisso.mes, Evento.datacompromisso.ano);
    printf("Nova Descricao: %s\n", Evento.descricao);


}
