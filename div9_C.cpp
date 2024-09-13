#include <stdio.h>

int main() {
    int a0 = 81;  // Cambia este valor para probar diferentes números
    int divisible_by_9;

    // Método de resta repetida para verificar divisibilidad por 9
    while (a0 >= 9) {
        a0 = a0 - 9;  // Resta 9 repetidamente
    }

    // Verifica si el resultado es 0
    if (a0 == 0) {
        divisible_by_9 = 1;  // Divisible por 9
    } else {
        divisible_by_9 = 0;  // No divisible por 9
    }

    printf("Divisible por 9: %d\n", divisible_by_9);

    return 0;
}
