.data
    a: .word 1
    b: .word 1
    c: .word 1
    d: .word 1
    e: .word 1
    f: .word 1
    g: .word 123

.text
    main:
        lw $a0, a
        lw $a1, b
        lw $a2, c
        lw $a3, d

        addi $sp, $sp, -12
        lw $t0, e
        lw $t1, f
        lw $t2, g
        sw $t0, 0($sp) # e
        sw $t1, 4($sp) # f
        sw $t2, 8($sp) # g

        jal operation

        addi $sp, $sp, 12

        move $a0, $v0
        li $v0, 1
        syscall

        li $v0, 10
        syscall

    operation:
        add $t0, $a0, $a1
        add $t1, $a2, $a3
        add $t2, $t0, $t1

        lw $t3, 0($sp)
        mul	$t0, $t2, $t3			# $t2 * $31 = Hi and Lo registers
        lw $t2, 4($sp)
        lw $t3, 8($sp)
        add $t2, $t2, $t3
        sub $v0, $t0, $t2

        jr $ra
        