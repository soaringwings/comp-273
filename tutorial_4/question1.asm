.data
    string: .asciiz "Hellow world\n"
    amount: .word 6

.text
    main:
        la $a0, string
        lw $a1, amount
        jal print

        li $v0, 10
        syscall

    print:
        addi, $sp, -4
        sw $s0, 0($sp)
        
        move $s0, $a1

    loop:
        li $v0, 4
        syscall
        addi $s0, $s0, -1
        bnez $s0, loop
