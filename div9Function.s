#Inicio del programa en RISC-V para crear una funcion que realice la logica de divisibilidad por 9 

    .text
    .globl div9
    .globl main

# Función div9: determina si el valor es divisible por 9
# Prototipo: int div9(unsigned int val);
div9:
    addi t1, x0, 9         # Cargar 9 en t1 (el divisor)
    addi t2, x0, 0         # Inicializar t2 (contador para restar)
    
check_loop:
    blt a0, t1, end        # Si a0 < 9, salir del bucle
    sub a0, a0, t1         # Resta 9 a a0 (a0 = a0 - 9)
    j check_loop           # Repetir el bucle
    
end:
    beq a0, x0, divisible  # Si a0 == 0, es divisible por 9
    addi a0, x0, 0         # No es divisible, devuelve 0
    jr ra                  # Retornar
    
divisible:
    addi a0, x0, 1         # Es divisible, devuelve 1
    jr ra                  # Retornar

# Programa principal para probar la función div9
main:
    # Prueba con div9(15)
    li a0, 15              # Cargar 15 en a0
    jal ra, div9           # Llamar a la función div9
    # Aquí a0 contendrá 0, ya que 15 no es divisible por 9

    # Prueba con div9(81)
    li a0, 81              # Cargar 81 en a0
    jal ra, div9           # Llamar a la función div9
    # Aquí a0 contendrá 1, ya que 81 es divisible por 9
    
    # Fin del programa
    j main                 # Bucle infinito (mantener ejecución)
