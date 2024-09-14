 .text
    .globl greet
    .globl main

# Función recursiva greet
# Prototipo: unsigned int greet(unsigned int n);
greet:
    # Guardar los registros preservados en la pila
    addi sp, sp, -8           # Crear espacio en la pila
    sw ra, 4(sp)              # Guardar ra (dirección de retorno)
    sw s0, 0(sp)              # Guardar s0

    mv s0, a0                 # Guardar el valor de 'n' en s0

    # Caso base: si n == 0 o n == 1, retornar 0
    li t0, 1                  # t0 = 1
    beq s0, x0, base_case     # Si n == 0, retornar 0
    beq s0, t0, base_case     # Si n == 1, retornar 0

    # Caso recursivo: n-1 + greet(n-1)
    addi a0, s0, -1           # a0 = n - 1
    jal ra, greet             # Llamar recursivamente a greet(n - 1)
    addi a0, s0, -1           # a0 = n - 1
    add a0, a0, a1            # Sumar resultado recursivo (a1) a (n - 1)

    j end                     # Saltar al final

base_case:
    li a0, 0                  # Retornar 0 si n == 0 o n == 1

end:
    # Restaurar los registros preservados
    lw ra, 4(sp)              # Restaurar ra (dirección de retorno)
    lw s0, 0(sp)              # Restaurar s0
    addi sp, sp, 8            # Ajustar puntero de pila
    jr ra                     # Retornar

# Programa principal para probar la función greet
main:
    # Cargar 4 en a0 (para probar greet(4))
    li a0, 4                  # Cargar 4 en a0
    jal ra, greet             # Llamar a la función greet
    # Aquí a0 contendrá el número de saludos para 4 personas, que es 6

    # Fin del programa (bucles infinitos para detener la ejecución)
    j main
