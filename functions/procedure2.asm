# arguments and return values
.data

.text
    main:

        addi $a1, $zero, 50
        addi $a2, $zero, 100

        jal addNumbers

        li $v0, 1
        addi $a0, $v1, 0
        syscall

    # tell the system that the program is done
    # addi $v0, $zero, 10
    li $v0, 10
    syscall

    addNumbers:
        # $v is for return values
        add $v1, $a1, $a2
        # jump register
        jr $ra
