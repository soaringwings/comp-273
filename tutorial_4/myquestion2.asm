.data
    result_msg: .asciiz "fibonacci sequence to the nth term: "
    newline: .asciiz "\n"

.text
    main:
        # ask for the nth term
        li $v0, 5
        syscall
        # a0 is the first argument to the function
        # it is the nth term
        move $a0, $v0

        # enter into the recursive function
        # the final return value is in $v0
        jal recursive
        # save the final return value into $t0
        move $t0, $v0

        # print result message
        li $v0, 4
        la $a0, result_msg
        syscall

        # print fibonacci result
        li $v0, 1
        move $a0, $t0
        syscall

        # print a newline
        li $v0, 4
        la $a0, newline
        syscall
        
        # exit the program
        li $v0, 10
        syscall

    # return n if n<=2
    # n<=2
    # n>2
    # return n-1 * n-2
    recursive:
        # allocate space on stack
        # save the callee-saved registers and the return address
        # move the pointer 16 bytes up (each register is 4 bytes)
        addi $sp, $sp, -16
        # save each value of s and ra
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $ra, 12($sp)

        # check for base cases
        # copy argument to saved reg
        move $s0, $a0
        # set s1 to 2 for base case comp.
        li $s1, 2
        blt $s0, $s1, base

        # set argument n-1
        addi $a0, $s0, -1
        # go into function
        jal recursive
        # move result in s2
        move $s2, $v0

        addi $a0, $s0, -2
        jal recursive
        add $v0, $v0, $s2
        j return

    base:
        move $v0, $s0

    return:
        # restore all saved registers and return address
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $ra, 12($sp)
        addi $sp, $sp, 16
        jr $ra
