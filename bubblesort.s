    .data
ordmatriz: 
    .word 89, 63, -55, -107, 42, 98, -425, 203, 0, 303  # Los 10 elementos a ordenar

    .text
    .globl _start
_start:
    # Inicialización de registros
    la s0, ordmatriz     # s0 = dirección base de ordmatriz (0x400)
    li s1, 10            # s1 = tamaño de ordmatriz (10)

outer_loop:
    # Configuración de la variable intercamb
    li s2, 0             # intercamb = 0 (s2)

    # Bucle interno (recorrido del array)
    li s3, 0             # i = 0 (s3)
    li s4, 9             # j = tamaño - 1 = 9 (s4)
inner_loop:
    # Cargar los elementos ordmatriz[j] y ordmatriz[j+1]
    slli t0, s3, 2       # t0 = j * 4 (índice en bytes)
    add t1, s0, t0       # t1 = dirección de ordmatriz[j]
    lw t2, 0(t1)         # t2 = ordmatriz[j]
    lw t3, 4(t1)         # t3 = ordmatriz[j+1]

    # Comparar ordmatriz[j] con ordmatriz[j+1]
    bge t2, t3, no_swap  # Si ordmatriz[j] <= ordmatriz[j+1], no hay intercambio

    # Intercambio ordmatriz[j] y ordmatriz[j+1]
    sw t3, 0(t1)         # ordmatriz[j] = t3
    sw t2, 4(t1)         # ordmatriz[j+1] = t2
    li s2, 1             # intercamb = 1

no_swap:
    addi s3, s3, 1       # j++
    blt s3, s4, inner_loop  # Repetir el bucle interno si j < tamaño - i - 1

    # Verificar si hubo intercambios (intercamb)
    beqz s2, done        # Si intercamb == 0, terminar
    addi s4, s4, -1      # Decrementar el tamaño del bucle interno

    j outer_loop         # Repetir el bucle externo

done:
    # Fin del programa (quedarse en un bucle infinito)
    j done
