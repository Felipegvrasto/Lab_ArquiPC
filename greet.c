#include <stdio.h>

// Función recursiva para calcular el número de saludos
unsigned int greet(unsigned int n) {
    if (n == 0 || n == 1) {
        return 0;  // Si hay 0 o 1 persona, no hay saludos
    }
    return (n - 1) + greet(n - 1);  // Suma los saludos y realiza la llamada recursiva
}

int main() {
    // Probar la función con 4 personas en la sala
    unsigned int result = greet(4);
    printf("El número de saludos para 4 personas es: %u\n", result);  // Espera 6

    return 0;
}
