#include <stdio.h>

struct funcionario{
    char nome[100];
    int idade;
    char sexo;
    char cpf[12];
    char datanasc[11];
    int codSetor;
    char cargo[30];
    float salario;
};

int main(){
struct funcionario f;
printf("Nome funcionario: ");
scanf(" %[^\n]", f.nome);   
printf("idade funcionario: ");
scanf(" %d", &f.idade);  

printf("sexo funcionario: ");
scanf(" %c",& f.sexo); 

while (f.sexo != 'M' && f.sexo != 'F'){
    printf("sexo funcionario precisa ser F ou M: ");
    scanf(" %c",& f.sexo); 
}

printf("cpf funcionario: ");
scanf(" %s", f.cpf);    
printf("datanasc funcionario: ");
scanf(" %s", f.datanasc);    
printf("codSetor funcionario: ");
scanf(" %d", &f.codSetor); 

while (f.codSetor < 0 || f.codSetor > 99){
    printf("codSetor funcionario precisa ser de 0-99: ");
scanf(" %d", &f.codSetor); 
}

printf("cargo funcionario: ");
scanf(" %[^\n]", f.cargo);    
printf("salario funcionario: ");
scanf(" %f",  &f.salario);    

printf("\n\n FUNCIONARIO:\n\nNome: %s\nidade: %d\nsexo: %c\ncpf: %s\ndata de nascimento: %s\nCodigo do setor: %d\nCargo: %s\nSalario: %.2f\n",
f.nome,f.idade,f.sexo,f.cpf,f.datanasc,f.codSetor,f.cargo,f.salario);


}