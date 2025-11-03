.data
    string: .asciiz "Hello world \n"
    # .word is used for integers
    # the value is 5
    amount: .word 5

.text
    main:
        # load into as first function argument
        # load the address of the string
        la $a0, string
        # load the integer (word) as the second function argument
        lw $a1, amount
        # jump and link to the print_string procedure
        jal print_string

        # exit the program by loading 10 into v0
        li $v0, 10
        syscall

    # a0-a3 are function arguments
    # v0-v1 are function return values
    # ra is the return address
    print_string:
        # function prologue - save callee-save register (s0?)
        # move the stack pointer up one word (4 bytes)
        addi $sp, $sp, -4
        # save the word at s0 to address at sp
        sw $s0, 0($sp)

        # use callee-save register (s0) for loop counter
        # copy a1 to s0
        move $s0, $a1

    print_string_loop:
        # print the string with the address at a0
        li $v0, 4
        syscall

        # decrement counter
        addi $s0, $s0, -1
        # branch if not equal to zero
        bnez $s0, print_string_loop

        # load integer in s0 to memory pointed by sp
        lw $s0, 0($sp)
        # deallocate stack space by moving the pointer down a word
        addi $sp, $sp, 4
        # jump register, go back to where ra points to
        jr $ra