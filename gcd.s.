 .text
    .globl gcd
    .globl main

# Función gcd: calcula el máximo común divisor de dos números según el algoritmo euclidiano

gcd:
    # Guardar los registros en la pila
    addi sp, sp, -8           # Hacer espacio en la pila para s0
    sw s0, 4(sp)              # Guardar s0 en la pila

    mv s0, a0                 # Guardar el valor de 'a' en s0 (preservar 'a' en un registro seguro)

gcd_loop:
    beq a1, x0, gcd_done      # Si b (a1) es 0, salir del bucle (a0 contendrá el MCD)
    rem a2, s0, a1            # Calcular el residuo (a % b) y guardarlo en a2
    mv s0, a1                 # Mover b a a
    mv a1, a2                 # Mover el resto a b
    j gcd_loop                # Repetir el bucle

gcd_done:
    mv a0, s0                 # Guardar el resultado (el MCD está en s0)

    # Restaurar los registros preservados
    lw s0, 4(sp)              # Restaurar s0 desde la pila
    addi sp, sp, 8            # Ajustar el puntero de pila
    jr ra                     # Retornar de la función

# Programa principal para probar la función gcd
main:
    # Probar gcd(25, 15)
    li a0, 25                 # Cargar 25 en a0
    li a1, 15                 # Cargar 15 en a1
    jal ra, gcd               # Llamar a la función gcd
    # Aquí a0 contendrá el MCD de 25 y 15, que es 5

    # Probar gcd(64, 96)
    li a0, 64                 # Cargar 64 en a0
    li a1, 96                 # Cargar 96 en a1
    jal ra, gcd               # Llamar a la función gcd
    # Aquí a0 contendrá el MCD de 64 y 96, que es 32

    # Probar gcd(71, 9)
    li a0, 71                 # Cargar 71 en a0
    li a1, 9                  # Cargar 9 en a1
    jal ra, gcd               # Llamar a la función gcd
    # Aquí a0 contendrá el MCD de 71 y 9, que es 1

    # Fin del programa (bucles infinitos para detener la ejecución)
    j main
