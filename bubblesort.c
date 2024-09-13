#include <stdio.h>
#define SIZE 10

void bubbleSort(int ordmatriz[], int size) {
    int i, j, temp;
    int intercamb;

    // Bucle externo que recorre el array
    for (i = 0; i < size - 1; i++) {
        intercamb = 0;  // No se han realizado intercambios anu
        // Bucle interno que compara elementos adyacentes
        for (j = 0; j < size - i - 1; j++) {
            if (ordmatriz[j] > ordmatriz[j + 1]) {
                // Intercambia los elementos adyacentes si estan en el orden incorrecto
                temp = ordmatriz[j];
                ordmatriz[j] = ordmatriz[j + 1];
                ordmatriz[j + 1] = temp;
                intercamb = 1;  // Se realiza un intercambio
            }
        }
        // Si no se realizo ningun intercambio, el array esta ordenado
        if (intercamb == 0) {
            break;
        }
    }
}

int main() {
    // Inicializar el array que se va a ordenar
    int ordmatriz[SIZE] = {89, 63, -55, -107, 42, 98, -425, 203, 0, 303};

    // Llamar a la funcion de ordenamiento por burbuja (Bubble Sort)
    bubbleSort(ordmatriz, SIZE);

    // Imprimir el array ordenado
    for (int i = 0; i < SIZE; i++) {
        printf("%d ", ordmatriz[i]);
    }

    return 0;
}
