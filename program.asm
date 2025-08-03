.text
main:
    # Inicialização dos endereços de memória
    li a0, 0x80             # Endereço base (128)
    
    # Armazenando Fib(1º) = 0 manualmente
    li t0, 0                # t0 = 0
    sw t0, 0(a0)            # Mem[0x80] = 0 (Fib(1º))
    
    # Armazenando Fib(2º) = 1 manualmente
    li t0, 1                # t1 = 1
    sw t0, 4(a0)            # Mem[0x84] = 1 (Fib(2º))
    
    # Calculando Fib(3º) = Fib(1º) + Fib(2º) = 0 + 1 = 1
    lw t0, 0(a0)            # Carrega Fib(1º)
    lw t1, 4(a0)            # Carrega Fib(2º)
    add t2, t0, t1          # t2 = 0 + 1
    sw t2, 8(a0)            # Mem[0x88] = 1 (Fib(3º))
    
    # Calculando Fib(4º) = Fib(2º) + Fib(3º) = 1 + 1 = 2
    lw t0, 4(a0)            # Carrega Fib(2º)
    lw t1, 8(a0)            # Carrega Fib(3º)
    add t2, t0, t1          # t2 = 1 + 1
    sw t2, 12(a0)           # Mem[0x8C] = 2 (Fib(4º))
    
    # Calculando Fib(5º) =  Fib(3º) + Fib(4º) = 1 + 2 = 3
    lw t0,  8(a0)           # Carrega Fib(2)
    lw t1, 12(a0)           # Carrega Fib(3)
    add t2, t0, t1          # t2 = 1 + 2
    sw t2, 16(a0)           # Mem[0x90] = 3
loop:
    j loop                  # Loop infinito para encerrar o programa