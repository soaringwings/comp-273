.data
    ArrayA: .word 1 2 3 4 5

.text
    main:
        la $s0, ArrayA
        lw $s1, 4($s0)
        li $v0, 1
        move $a0, $s1
        syscall