.text

.globl __start

__start:
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    add, $t2, $t0, $t1

    bltz $t2, error
    
    li $t3, 127

    slt $t4, $t3, $t2
    bne $t4, $zero, error


    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 11
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

error:
	li $v0, 4
    la $a0, errmsg
    syscall

    li $v0, 10
    syscall


.data
msg:
    .asciiz "The ASCII char is: "
errmsg:
    .asciiz "Outside of ASCII range"