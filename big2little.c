#include <stdint.h>
#include <stdio.h>

// Función para convertir una palabra de big-endian a little-endian
uint32_t big_to_little_endian(uint32_t word) {
    return ((word >> 24) & 0xFF) |         // Byte más significativo
           ((word >> 8) & 0xFF00) |        // Segundo byte
           ((word << 8) & 0xFF0000) |      // Tercer byte
           ((word << 24) & 0xFF000000);    // Byte menos significativo
}

int main() {
    // Definición del array de palabras en big-endian (8 palabras)
    uint32_t words[8] = {
        0x1234ABCD, 0x56789ABC, 0xDEADBEEF, 0xCAFEBABE,
        0x0F0E0D0C, 0xAABBCCDD, 0x11223344, 0x55667788
    };

    // Convertir las palabras de big-endian a little-endian
    for (int i = 0; i < 8; i++) {
        words[i] = big_to_little_endian(words[i]);
    }

    // Imprimir las palabras convertidas a little-endian
    for (int i = 0; i < 8; i++) {
        printf("Word %d: 0x%08X\n", i, words[i]);
    }

    return 0;
}
