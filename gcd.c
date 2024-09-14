#include <stdio.h>

// Función para encontrar el MCD (Algoritmo Euclidiano)
unsigned int gcd(unsigned int a, unsigned int b) {
    while (b != 0) {   // Mientras b no sea cero
        unsigned int remainder = a % b;  // Calcular el resto de a / b
        a = b;  // Reemplazar a con b
        b = remainder;  // Reemplazar b con el resto
    }
    return a;  // Cuando b es 0, a es el MCD
}

int main() {
    // Probar la función gcd con los valores proporcionados
    printf("gcd(25, 15) = %u\n", gcd(25, 15));  // Espera 5
    printf("gcd(64, 96) = %u\n", gcd(64, 96));  // Espera 32
    printf("gcd(71, 9) = %u\n", gcd(71, 9));    // Espera 1

    return 0;
}
