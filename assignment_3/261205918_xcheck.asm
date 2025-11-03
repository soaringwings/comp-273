.text

.globl __start

__start:
    li $v0, 8
    la $a0, string
    li $a1, 1024
    syscall
    move $t0, $a0
    # t0 is the address of the string
    li $t2, 0
    li $t3, 0
    # t3 for if there is an x
    li $t4, 'x'

LoopStart:
    # $t1 is the char
    # let t2 be the length of the string
    lb $t1, 0($t0)
    beqz $t1, LoopEnd
    addi $t2, $t2, 1
    addi $t0, $t0, 1
    beq $t1, $t4, x
    j LoopStart

x:
    li $t3, 1
    j LoopStart

LoopEnd:
    beq, $t3, 1, thereisx
    beqz, $t3, therenox

main_end:
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

thereisx:
    li $v0, 4
    la $a0, thereis
    syscall
    j main_end

therenox:
    li $v0, 4
    la $a0, thereno
    syscall
    j main_end

.data
string: 
.space 1024
thereis:
.asciiz "There is an x or X\n"
thereno:
.asciiz "There is no x or X!\n"