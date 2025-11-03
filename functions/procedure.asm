# procedure is just a function
.data
    message: .asciiz "Hi, everybody.\nMy name is Alex.\n"

.text
    main:
    # main function

        # jump and link
        jal displayMessage

        addi $s0, $0, 5

        # print num 5 to the screen
        li $v0, 1
        add $a0, $zero, $s0
        syscall

    # tell the system that the program is done
    li $v0, 10
    syscall

    # another function
    displayMessage:
        li $v0, 4
        la $a0, message
        syscall

        # go back to where you called it
        jr $ra