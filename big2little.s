# Convertir 8 palabras de big-endian a little-endian
# La memoria comienza en la dirección 0x300

    .data
    .word 0x1234ABCD, 0x56789ABC, 0xDEADBEEF, 0xCAFEBABE  # Palabras de ejemplo
    .word 0x0F0E0D0C, 0xAABBCCDD, 0x11223344, 0x55667788  # Palabras de ejemplo

    .text
    .globl _start
_start:
    addi t0, x0, 0x300       # Cargar la dirección base (0x300) en el registro t0
    addi t1, x0, 8           # Establecer el número de palabras a convertir (8 palabras) en t1
    addi t2, x0, 0           # Establecer el desplazamiento inicial (0 bytes) en t2

convert_word:
    # Cargar los 4 bytes (orden big-endian) de la memoria
    lb t3, 0(t0)             # Cargar el byte 0 (más significativo) de la palabra en t3
    lb t4, 1(t0)             # Cargar el byte 1 en t4
    lb t5, 2(t0)             # Cargar el byte 2 en t5
    lb t6, 3(t0)             # Cargar el byte 3 (menos significativo) en t6

    # Almacenar los bytes en orden little-endian
    sb t6, 0(t0)             # Almacenar el byte menos significativo en la posición 0
    sb t5, 1(t0)             # Almacenar el byte 2 en la posición 1
    sb t4, 2(t0)             # Almacenar el byte 1 en la posición 2
    sb t3, 3(t0)             # Almacenar el byte más significativo en la posición 3

    # Pasar a la siguiente palabra (incrementar la dirección en 4 bytes)
    addi t0, t0, 4           # Mover a la siguiente palabra (4 bytes hacia adelante)
    addi t2, t2, 4           # Incrementar el contador de desplazamiento en 4 bytes

    # Verificar si hemos procesado 8 palabras
    blt t2, t1, convert_word # Si no hemos terminado, volver a convertir la siguiente palabra

    # Fin del programa
    nop                      # No-operation (instrucción de relleno para el final del programa)
