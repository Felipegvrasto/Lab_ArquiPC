
    .data
    # Inicializar el array con 15 elementos en la dirección 0x400
    .align 4
sortarray:
    .word -15, 42, 73, 19, -8, 24, 16, -2, 99, -78, -21, 23, -88, 49, -101

    .text
    .globl bubbleSort
    .globl main

# Función bubbleSort: ordena un array de menor a mayor

bubbleSort:
    addi s1, a1, -1            # s1 = size - 1 (número de iteraciones)
    
outer_loop:
    addi s2, x0, 0             # s2 = intercamb = 0
    addi s3, x0, 0             # s3 = i = 0

inner_loop:
    blt s1, s3, end_outer      # Si size - 1 <= i, salir del bucle externo
    slli t0, s3, 2             # t0 = i * 4 (desplazamiento en bytes)
    add t1, a0, t0             # t1 = dirección de sortarray[i]
    lw t2, 0(t1)               # t2 = sortarray[i]
    lw t3, 4(t1)               # t3 = sortarray[i+1]
    
    # Comparar sortarray[i] con sortarray[i+1]
    blt t2, t3, no_swap        # Si sortarray[i] < sortarray[i+1], no intercambiar
    # Intercambiar sortarray[i] y sortarray[i+1]
    sw t3, 0(t1)               # sortarray[i] = sortarray[i+1]
    sw t2, 4(t1)               # sortarray[i+1] = sortarray[i]
    addi s2, s2, 1             # intercamb = 1

no_swap:
    addi s3, s3, 1             # i++
    blt s3, s1, inner_loop     # Repetir el bucle interno

    beqz s2, end_outer         # Si no hubo intercambios, salir del bucle
    addi s1, s1, -1            # Decrementar tamaño del bucle interno
    j outer_loop               # Repetir el bucle externo

end_outer:
    jr ra                      # Retornar de la función

# Programa principal para probar la función bubbleSort
main:
    la a0, sortarray           # Cargar la dirección base de sortarray
    li a1, 15                  # Cargar el tamaño del array (15 elementos)
    jal ra, bubbleSort         # Llamar a la función bubbleSort

    # Fin del programa (bucles infinitos para detener la ejecución)
    j main
\end{minted}
