<stdio.h>

int main(){
    int num1; 
    int num2 = 1;
    int soma = 0;

    printf("Escreva os número: \n");
    scanf("%d", &num1);

    if(num1 >=0 && num <= 127){
        soma = num1 + num2;
    }

    else 
        printf("Entrada incorreta");

return 0;
}