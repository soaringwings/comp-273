.data

    n: .word 6
    resultmsg: .asciiz "result is: "



.text

    main:
        lw $a0, n
        jal fibonacci
        move $t0, $v0
        addi $v0, $v0, 4
        move $a0, $t0
        syscall
        li $v0, 1
        la 




    fibonacci:
        addi $sp, $sp, -16
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $s4, 12($sp)
        # check the base case
        # when n = 0 or n = 1
        move $s0, $a0
        li $s1 2
        blt $s0, $s1
        addi $a0, $s0 - 1
        jal fibonacci
        move $s2, $v0 # n - 2
        addi $a0, $s0 # n * 2
        jal fibonacci
        add $v0, $s2 # f(n-1)+f(n-2)


    base:
        move $v0, $s0

    return:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $ra, 12($sp)
        lw $sp, $sp, 16
        addi $sp, $sp, 16
        jr $ra
        
