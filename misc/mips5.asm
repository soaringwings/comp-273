.text

.globl __start

__start:
    li $v0, 5 # prime syscall for reading
    syscall # read from stdin
    move $t0, $v0 # copy the input into t0 which will be n 
    li $t1, 1 # load immediate 1 into t1 which is res

LoopStart:
    # $t0 is n
    # $t1 is res
    beq $t0, 0, LoopEnd # if n is equal to 0 jump to LoopEnd
    # someting
    mul $t1, $t1, $t0
    addi $t0, $t0, -1
    j LoopStart
LoopEnd:
    li $v0, 1
    move $a0, $t1
    syscall
    
.data

# res:
# .word 1
