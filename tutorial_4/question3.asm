.data
    A: .word 3, 1, 4, 1, 5
    B: .word 2, 7, 1, 8, 2, 9
    lenA: .word 5
    lenB: .word 6
    msgA: .asciiz "Array A has the larger sum.\n"
    msgB: .asciiz "Array B has the larger sum.\n"

.text
    main:
        # set first argument
        la $a0, A
        # set second argument
        lw $a1 lenA
        jal sumArray
        # save return value
        move $s0, $v0

        la $a0, B
        lw $a1, lenB
        jal sumArray

        bgt $s0, $s1, printA
        j printB
    
        printA:
            la $a0, msgA
            li $v0, 4
            syscall
            j done

        printB:
            la $a0, msgB
            li $v0, 4
            syscall
            j done

        # exit
        li $v0, 10
        syscall

    sumArray:
        addi $sp, $sp, -12 # allocate 3 registers
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $ra, 8($sp)

        # s0 is the counter
        addi $s0, $0, 0
        # s1 is the sum
        addi $s1, $0, 0

    loop:
        # branch to done if counter is equal to the len of the string
        beq $s0, $a1, done
        # times counter by 4 for the offset
        sll $t2, $s0, 2
        # add the offset to the address of element
        add $t3, $a0, $t2
        # dereference the address
        lw $t4, 0($t3)
        # add element to sum
        add $s1, $s1, $t4
        # increment counter
        addi $s0, $s0, 1
        j loop

    done:
        # store sum into return register
        move $v0, $s1
        # restore ra, s0, s1
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $ra, 8($sp)
        addi $sp, $sp, 12

        jr $ra



        




    done:
        