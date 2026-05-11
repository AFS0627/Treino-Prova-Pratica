#include <stdio.h>
#include <math.h>

struct polar{
    float raio;
    float argumento;
};

struct coordenada{
    float x;
    float y;
};

int main(){
    struct polar p;
    struct coordenada c;
    printf("raio: ");
    scanf("%f", &p.raio);
    printf("argumento: ");
    scanf("%f", &p.argumento);

    c.x = p.raio * cos(p.argumento);
    c.y = p.raio * sin(p.argumento);

    printf("\nCoordenadas cartesianas:\n");

    printf("x = %.2f\n", c.x);
    printf("y = %.2f\n", c.y);
}

