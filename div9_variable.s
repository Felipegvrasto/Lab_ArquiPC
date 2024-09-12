# Program to check if a0 is divisible by 9
# If divisible, a0 = 1; else a0 = 0

    addi a0, x0, 9     # Cargar el valor 9 en a0 (Variar este valor '9' para hacer pruebas)
    addi t0, x0, 9     # Load constant 9 into t0 (divisor)
    addi t1, x0, 0     # Initialize t1 (remainder) to 0
    addi t2, x0, 0     # Initialize t2 (quotient) to 0

loop:
    blt a0, t0, end    # If a0 < 9, exit loop
    sub a0, a0, t0     # a0 = a0 - 9 (subtract 9 from a0)
    addi t2, t2, 1     # t2 = t2 + 1 (increment quotient)
    j loop             # Jump back to loop

end:
    beq a0, x0, divisible  # If a0 == 0, jump to divisible
    addi a0, x0, 0         # Set a0 to 0 (not divisible)
    j finish               # Jump to finish

divisible:
    addi a0, x0, 1         # Set a0 to 1 (divisible by 9)

finish:
    # Program ends
