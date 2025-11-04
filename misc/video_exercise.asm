.data
    message: .asciiz "Hi, everybody my name is Alex\n"




.text
    main:
    # jump and link
        jal displayMessage

        li $v0, 10
        syscall

    displayMessage:
        #  display text on the screen
        li $v0, 4
        la $a0, message
        syscall

        # jump register
        jr $ra


