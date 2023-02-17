# IS727272 - Cordero Hern�ndez, Marco Ricardo
# 1 - Calculadora

# Inicializaci�n de variables
main:   addi s0, zero, 3        # Selector
        addi s1, zero, 5        # a
        addi s2, zero, 3        # b
        addi s3, zero, 0        # c

        # Valores para funciones subsequentes
        add a0, s1, zero
        add a1, s2, zero 

# Comparaci�n para switch mediante sumas
switch: addi t3, zero, 1
        beq s0, t3, suma        # case 1

        addi t3, t3, 1
        beq s0, t3, resta       # case 2

        addi t3, t3, 1
        beq s0, t3, mult        # case 3

        jal zero, andbit        # default

# case 1: suma
suma:   jal ra, fn_suma         # Llamada a funci�n
        add s3, a0, zero        # c = suma(a, b)
        jal zero, end           # Fin

# case 2: resta
resta:  jal ra, fn_resta        # Llamada a funci�n
        add s3, a0, zero        # c = resta(a, b)
        jal zero, end           # Fin

# case 3: multiplicaci�n
mult:   jal ra, fn_mult         # Llamada a funci�n 
        add s3, a0, zero        # c = multiplicaci�n(a, b)
        jal zero, end           # Fin

# case 4: bitwise and
andbit: jal ra, fn_andbit       # Llamada a funci�n
        add s3, a0, zero        # c = a & b
        jal zero, end           # Fin

# Definici�n de funciones a llamar dentro del switch
# Funci�n de suma
fn_suma: addi sp, sp, -4        # Se guarda un valor de 4 bytes en stack
        sw s0, 0(sp)            # Se guarda la direcci�n de retorno
        add s0, zero, zero      # Se asegura variable c limpia
        add s0, a0, a1          # Suma c = a + b
        add a0, s0, zero        # Se guarda el resultado para retorno
        lw s0, 0(sp)            # Se carga la direcci�n de retorno
        addi sp, sp, 4          # Se retorna el valor del stack
        jalr zero, ra, 0        # Retorno de funci�n

# Funci�n de resta
fn_resta: addi sp, sp, -4       # Se guarda un valor de 4 bytes en stack
        sw s0, 0(sp)            # Se guarda la direcci�n de retorno
        add s0, zero, zero      # Se asegura variable c limpia
        sub s0, a0, a1          # Resta c = a - b
        add a0, s0, zero        # Se guarda el resultado para retorno
        lw s0, 0(sp)            # Se carga la direcci�n de retorno
        addi sp, sp, 4          # Se retorna el valor del stack
        jalr zero, ra, 0        # Retorno de funci�n

# Funci�n de multiplicaci�n
fn_mult: addi sp, sp, -4        # Se guarda un valor de 4 bytes en stack
        sw s0, 0(sp)            # Se guarda la direcci�n de retorno
        add s0, zero, zero      # Se asegura variable c limpia
        mul s0, a0, a1          # Multiplicaci�n c = a - b
        add a0, s0, zero        # Se guarda el resultado para retorno
        lw s0, 0(sp)            # Se carga la direcci�n de retorno
        addi sp, sp, 4          # Se retorna el valor del stack
        jalr zero, ra, 0        # Retorno de funci�n

# Funci�n de bitwise and
fn_andbit: addi sp, sp, -4      # Se guarda un valor de 4 bytes en stack
        sw s0, 0(sp)            # Se guarda la direcci�n de retorno
        add s0, zero, zero      # Se asegura variable c limpia
        and s0, a0, a1          # Bitwise and c = a & b
        add a0, s0, zero        # Se carga la direcci�n de retorno
        lw s0, 0(sp)            # Se retorna el valor del stack
        jalr zero, ra, 0        # Retorno de funci�n

# Loop para quedarse indefinidamente en esta instrucci�n (return final)
end: jal zero, end