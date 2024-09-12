#include <stdio.h>

int main() {
    int a0 = 9 ;  // Cambia este valor para probar diferentes números
    int sum = 0;

    // Calcula la suma de los dígitos
    while (a0 > 0) {
        sum += a0 % 10;  // Suma el último dígito
        a0 /= 10;        // Elimina el último dígito
    }

    // Verifica si la suma de los dígitos es divisible por 9
    if (sum % 9 == 0) {
        a0 = 1;  // Divisible por 9
    } else {
        a0 = 0;  // No divisible por 9
    }

    printf("Divisible por 9: %d\n", a0);

    return 0;
}
