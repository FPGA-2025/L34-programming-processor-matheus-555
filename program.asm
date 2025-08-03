.text
main:
    # Inicialização do endereço base (0x80)
    lui a0, 0x00000        # Carrega parte alta de 0x00000000
    addi a0, a0, 0x80      # Adiciona 0x80 (a0 = 0x00000080)

    # Armazenando Fib(1º) = 0
    addi t0, zero, 0       # t0 = 0
    sw t0, 0(a0)           # Mem[0x80] = 0

    # Armazenando Fib(2º) = 1
    addi t0, zero, 1       # t0 = 1
    sw t0, 4(a0)           # Mem[0x84] = 1

    # Calculando Fib(3º) = Fib(1º) + Fib(2º)
    lw t0, 0(a0)           # t0 = Mem[0x80] (Fib(1º))
    lw t1, 4(a0)           # t1 = Mem[0x84] (Fib(2º))
    add t2, t0, t1         # t2 = 0 + 1
    sw t2, 8(a0)           # Mem[0x88] = 1

    # Calculando Fib(4º) = Fib(2º) + Fib(3º)
    lw t0, 4(a0)           # t0 = Mem[0x84] (Fib(2º))
    lw t1, 8(a0)           # t1 = Mem[0x88] (Fib(3º))
    add t2, t0, t1         # t2 = 1 + 1
    sw t2, 12(a0)          # Mem[0x8C] = 2

    # Calculando Fib(5º) = Fib(3º) + Fib(4º)
    lw t0, 8(a0)           # t0 = Mem[0x88] (Fib(3º))
    lw t1, 12(a0)          # t1 = Mem[0x8C] (Fib(4º))
    add t2, t0, t1         # t2 = 1 + 2
    sw t2, 16(a0)          # Mem[0x90] = 3

loop:
    j loop                # Loop infinito para encerrar o programa