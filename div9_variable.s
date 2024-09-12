# Programa para comprobar si a0 es divisible por 9
# si es divisible, a0 = 1; si no a0 = 0

    addi a0, x0, 9     # Cargar el valor 9 en a0 (Variar este valor '9' para hacer pruebas)
   addi t0, x0, 9     # Cargar constante 9 en t0 (divisor)
    addi t1, x0, 0     # Inicializar t1 (residuo) to 0
    addi t2, x0, 0     # Inicializar t2 (cociente) to 0

loop:
    blt a0, t0, end    # Si a0 < 9, salir del loop
    sub a0, a0, t0     # a0 = a0 - 9 (restar 9 de a0)
    addi t2, t2, 1     # t2 = t2 + 1 (incrementar cociente)
    j loop             # saltar al loop

end:
    beq a0, x0, divisible  # si a0 == 0, saltar a divisible
    addi a0, x0, 0         # Colocar a0 en 0 (no divisible)
    j finish               # salta a finish

divisible:
    addi a0, x0, 1         # Set a0 to 1 (divisible by 9)

finish:
    # fin del programa
